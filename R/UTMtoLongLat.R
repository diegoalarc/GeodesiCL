#' To convert from UTM to Geographic coordinate.
#'
#' With this function it is possible to convert from UTM coordinate to Geographic coordinate. It is also possible to convert to other coordinate reference systems by selecting their EPGS number. Review notes and references.
#'
#' @param utm_df Point name, East and North UTM in a data.frame.
#' @param zone Select UTM zone to work.
#' @param hemisphere select between north or south (written in lowercase). DEFAULT: "south"
#' @param crs EPGS number of the new coordinate reference system to transform. DEFAULT: 4326 (WGS84)
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return a list with a data.frame and leaflet map.
#'
#' @seealso \code{data.frame}
#'
#' @export
#'
#' @note create data frame of epsg codes by epsg <- rgdal::make_EPSG()
#'
#' @references https://github.com/OSGeo/PROJ & https://github.com/cran/rgdal
#'
#' @examples
#' \donttest{
#' # Load test data from the package
#' csv <- system.file("extdata", "test.csv", package = "GeodesiCL")
#' data_test <- read_data(csv)
#'
#' # Zone
#' zone <- 19
#'
#' # Hemisphere could be "north" or "south"
#' hemisphere <- "south"
#'
#' value <- UTMtoLongLat(data_test, zone, hemisphere = "south", crs = 4326, digits = 4)
#' print(value)
#' }
UTMtoLongLat <- function(utm_df, zone, hemisphere = "south", crs = 4326, digits = 4){

  df <- data.frame(East = as.numeric(unlist(utm_df[,2])),
                   North = as.numeric(unlist(utm_df[,3])))
  sp::coordinates(df) <- c("East", "North")

  sp::proj4string(df) <- sp::CRS(paste0(
    "+proj=utm +zone=", zone,
    " +", hemisphere,
    " +datum=WGS84",
    " +units=m",
    " +no_defs +type=crs"))

  res <- sp::spTransform(df, sp::CRS(paste0("+init=epsg:",crs))) %>% data.frame()

  value <- tibble::as_tibble(as.data.frame(cbind(unlist(utm_df[,1]),
                                                 round(as.numeric(unlist(res[,1])), digits),
                                                 round(as.numeric(unlist(res[,2])), digits))))
  names(value) <- c("Pt", "Long", "Lat")

  map <- leaflet::leaflet(value) %>% leaflet::addTiles() %>%
    leaflet::addMarkers(data = value,
      as.numeric(value$Long), as.numeric(value$Lat),
      label = paste("Name: ", value$Pt, "<br>",
                    "Longitude: ", as.numeric(value$Long), "<br>",
                    "Latitude: ", as.numeric(value$Lat)) %>%
        lapply(htmltools::HTML)) %>%
    leaflet::addProviderTiles("OpenStreetMap", group = "OpenStreetMap") %>%
    leaflet::addProviderTiles("Stamen.Toner", group = "Stamen.Toner") %>%
    leaflet::addProviderTiles("Stamen.Terrain", group = "Stamen.Terrain") %>%
    leaflet::addProviderTiles("Esri.WorldStreetMap", group = "Esri.WorldStreetMap") %>%
    leaflet::addProviderTiles("Wikimedia", group = "Wikimedia") %>%
    leaflet::addProviderTiles("CartoDB.Positron", group = "CartoDB.Positron") %>%
    leaflet::addProviderTiles("Esri.WorldImagery", group = "Esri.WorldImagery") %>%
    leaflet::addLayersControl(baseGroups = c("OpenStreetMap", "Stamen.Toner",
                                             "Stamen.Terrain", "Esri.WorldStreetMap",
                                             "Wikimedia", "CartoDB.Positron", "Esri.WorldImagery"),
                              position = "topleft")

  methods::show(map)
  return(value)
}
