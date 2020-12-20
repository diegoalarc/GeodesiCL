#' To convert from UTM to Geographic coordinate.
#'
#' With this function it is possible to convert from UTM coordinate to Geographic coordinate.
#'
#' @param utm_df Point name, East and North UTM in a data.frame.
#' @param zone Select UTM zone to work.
#' @param hemisphere select between north or south (written in lowercase). DEFAULT: "south"
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return a list with a data.frame [[1]] and leaflet map [[2]].
#'
#' @export
#'
#' @examples
#' # Point name
#' Pto <- "St1"
#'
#' # Value for East
#' East <- 650012.58
#'
#' # Value for North
#' North <- 5590735.41
#'
#' # East and North as data.frame
#' utm_df <- data.frame(Pto,East,North)
#'
#' # Zone
#' zone <- 18
#'
#' # Hemisphere could be "north" or "south"
#' hemisphere <- "south"
#'
#' value <- UTMtoLongLat(utm_df, zone, hemisphere = "south", digits = 4)
#' print(value)
UTMtoLongLat <- function(utm_df, zone, hemisphere = "south", digits = 4){

  df <- data.frame(East = as.numeric(utm_df[,2]), North = as.numeric(utm_df[,3]))
  sp::coordinates(df) <- c("East", "North")

  sp::proj4string(df) <- sp::CRS(paste0(
    "+proj=utm +zone=", zone,
    " +ellps=WGS84",
    " +", hemisphere,
    " +units=m",
    " +datum=WGS84"))

#  sp::proj4string(df) <- sp::CRS(CRSstring)

  res <- sp::spTransform(df, sp::CRS("+init=epsg:4326")) %>%
    data.frame()

  value <- tibble::as_tibble(as.data.frame(cbind(utm_df[,1],round(as.numeric(res[,1]), digits), round(as.numeric(res[,2]), digits))))
  names(value) <- c("Pt", "Long", "Lat")

  map <- leaflet::leaflet(value) %>% leaflet::addTiles() %>%
    leaflet::addMarkers(
      data = value,
      as.numeric(value$Long), as.numeric(value$Lat),
      # create custom labels
      label = paste(
        "Name: ", value$Pt, "<br>",
        "Longitude: ", as.numeric(value$Long), "<br>",
        "Latitude: ", as.numeric(value$Lat)) %>%
        lapply(htmltools::HTML)) %>%
    # add different provider tiles
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

  return(list(value, map))
}
