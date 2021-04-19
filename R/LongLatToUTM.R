#' To convert from Geographic coordinate to UTM coordinate.
#'
#' With this function it is possible to convert from Geographic coordinate
#' to UTM coordinate. It is also possible to convert from other coordinate
#' reference systems by selecting their EPGS number to UTM coordinate.
#' Review notes and references.
#'
#' @param longlat_df Point name, Sexagesimal longitude and latitude as
#' dataframe.
#' @param crs EPGS number of the new coordinate reference system to transform.
#' DEFAULT: 4326 (WGS84)
#' @param units Select units for UTM to work. DEFAULT: 'm'
#' @param digits Number of digits are \code{\link{round}ed} to. DEFAULT: 4
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
#' # Point name
#' Pto <- "St1"
#'
#' # Longitude
#' g <- -71
#' m <- 18
#' s <- 44.86475
#'
#' # Value in sexagesimal
#' sexa_long <- sexagesimal(g, m, s)
#'
#' # Latitude
#' g1 <- -33
#' m1 <- 12
#' s1 <- 27.11457
#'
#' # Value in sexagesimal
#' sexa_lat <- sexagesimal(g1, m1, s1)
#'
#' # Longitude and Latitude as data.frame
#' longlat_df <- data.frame(Pto,sexa_long,sexa_lat)
#'
#' value <- LongLatToUTM(longlat_df, crs = 4326, units = 'm', digits = 4)
#' print(value)
#' }
LongLatToUTM <- function(longlat_df, crs = 4326, units = 'm', digits = 4){

  df <- data.frame(long = round(as.numeric(unlist(longlat_df[,2])), digits),
                   lat = round(as.numeric(unlist(longlat_df[,3])), digits))
  sp::coordinates(df) <- c("long", "lat")

  hemisphere <- ifelse(as.numeric(unlist(longlat_df[,3])) > 0, "north", "south")
  zone <- (floor((as.numeric(unlist(longlat_df[,2])) + 180) / 6) %% 60) + 1

  sp::proj4string(df) <-sp::CRS(paste0("+init=epsg:",crs))

  CRSstring <- paste0(
    "+proj=utm +zone=", zone,
    " +", hemisphere,
    " +datum=WGS84",
    " +units=", units,
    " +no_defs +type=crs")

  if(dplyr::n_distinct(CRSstring) > 1L)
    stop("multiple zone/hemisphere detected")

  res <- sp::spTransform(df, sp::CRS(CRSstring[1L])) %>%
    data.frame() %>% dplyr::mutate(zone_hemisphere = paste(zone,hemisphere))

  value <- tibble::as_tibble(as.data.frame(
    cbind(unlist(longlat_df[,1]),
          round(as.numeric(unlist(res[,1])), digits),
          round(as.numeric(unlist(res[,2])), digits),
          as.character(unlist(res[,3])))))

  names(value) <- c("Pt", "East", "North", "zone_hemisphere")

  map <- leaflet::leaflet(value) %>% leaflet::addTiles() %>%
    leaflet::addMarkers(data = df,
      as.numeric(df$long), as.numeric(df$lat),
      label = paste("Name: ", value$Pt, "<br>",
                    "East: ", as.numeric(value$East), "<br>",
                    "North: ", as.numeric(value$North), "<br>",
                    "zone hemisphere: ",
                    as.character(value$zone_hemisphere)) %>%
    lapply(htmltools::HTML)) %>%
    leaflet::addProviderTiles("OpenStreetMap", group = "OpenStreetMap") %>%
    leaflet::addProviderTiles("Stamen.Toner", group = "Stamen.Toner") %>%
    leaflet::addProviderTiles("Stamen.Terrain", group = "Stamen.Terrain") %>%
    leaflet::addProviderTiles("Esri.WorldStreetMap",
                              group = "Esri.WorldStreetMap") %>%
    leaflet::addProviderTiles("Wikimedia", group = "Wikimedia") %>%
    leaflet::addProviderTiles("CartoDB.Positron",
                              group = "CartoDB.Positron") %>%
    leaflet::addProviderTiles("Esri.WorldImagery",
                              group = "Esri.WorldImagery") %>%
    leaflet::addLayersControl(baseGroups = c("OpenStreetMap", "Stamen.Toner",
                                             "Stamen.Terrain",
                                             "Esri.WorldStreetMap",
                                             "Wikimedia", "CartoDB.Positron",
                                             "Esri.WorldImagery"),
                              position = "topleft")

  methods::show(map)
  return(value)
}
