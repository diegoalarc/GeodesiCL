#' LongLatToUTM
#'
#' To convert from Longitude and Latitude to UTM.
#'
#' @param longlat_df Sexagesimal longitude and latitude as dataframe.
#' @param units Select units for UTM to work. DEFAULT: 'm'
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame
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
#' longlat_df <- as.data.frame(cbind(Pto,sexa_long,sexa_lat))
#'
#' value <- LongLatToUTM(longlat_df, units = 'm', digits = 4)
#' print(value)
LongLatToUTM <- function(longlat_df, units = 'm', digits = 4){

  df <- data.frame(long = round(as.numeric(longlat_df[,2]), digits), lat = round(as.numeric(longlat_df[,3]), digits))
  sp::coordinates(df) <- c("long", "lat")

  hemisphere <- ifelse(as.numeric(longlat_df[,3]) > 0, "north", "south")
  zone <- (floor((as.numeric(longlat_df[,2]) + 180) / 6) %% 60) + 1

  sp::proj4string(df) <- sp::CRS("+init=epsg:4326")
  CRSstring <- paste0(
    "+proj=utm +zone=", zone,
    " +ellps=WGS84",
    " +", hemisphere,
    " +units=", units,
    " +datum=WGS84")
  if (dplyr::n_distinct(CRSstring) > 1L)
    stop("multiple zone/hemisphere detected")

#  pjct_num <- rgdal::showEPSG(paste0("+proj=utm +zone=", zone, " +ellps=WGS84 +", hemisphere))

  ######
#  epsg_utm <- leaflet::leafletCRS(
#    crsClass = "L.Proj.CRS",
#    code = paste0("EPSG:",pjct_num),
#   proj4def = paste0("+proj=utm +zone=", zone, " +ellps=WGS84 +", hemisphere, " +towgs84=0,0,0,0,0,0,0 +units=", units," +no_defs"),
#    resolutions = 0.42*(2^(14:0)),
#    origin = c(0, 0))
  #####

  res <- sp::spTransform(df, sp::CRS(CRSstring[1L])) %>%
    data.frame() %>%
    dplyr::mutate(zone_hemisphere = paste(zone,hemisphere))

  value <- as.data.frame(cbind(longlat_df[,1],round(as.numeric(res[,1]), digits), round(as.numeric(res[,2]), digits)))
  names(value) <- c("Pt", "East", "North")
  value1 <- data.frame(value, res[,3])

  map <- leaflet::leaflet(value) %>% leaflet::addTiles() %>%
    leaflet::addMarkers(
      data = df,
      as.numeric(df$long), as.numeric(df$lat),
      # create custom labels
      label = paste(
        "Name: ", value1$Pt, "<br>",
        "East: ", as.numeric(value1$East), "<br>",
        "North: ", as.numeric(value1$North), "<br>",
        "zone hemisphere: ", as.character(res[,3])) %>%
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
  return(list(value1, map))
}
