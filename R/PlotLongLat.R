#' To plot using Geographic coordinate.
#'
#' With this function it is possible to plot using Longitude and Latitude (Geographic coordinate).
#'
#' @param longlat_df Point name, Sexagesimal longitude and latitude as dataframe.
#'
#' @return leaflet map.
#'
#' @export
#'
#' @examples
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
#' value <- PlotLongLat(longlat_df)
#' print(value)
PlotLongLat <- function(longlat_df){

  df <- data.frame(Long = as.numeric(longlat_df[,2]), Lat = as.numeric(longlat_df[,3]))

  sp::coordinates(df) <- c("Long", "Lat")

  sp::proj4string(df) <- sp::CRS("+init=epsg:4326")

  res <- sp::spTransform(df, sp::CRS("+init=epsg:4326")) %>%
    data.frame()

  value <- as.data.frame(cbind(longlat_df[,1],as.numeric(res[,1]), as.numeric(res[,2])))
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

  return(map)
}
