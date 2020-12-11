#' UTMtoLongLat
#'
#' To convert from UTM to Longitude and Latitude
#'
#' @param utm_df East and North UTM in a data.frame.
#' @param zone Select UTM zone to work.
#' @param hemisphere select between north or south (written in lowercase).
#'
#' @return data.frame
#' @export
#'
#' @examples
#' # Value for East
#' East <- 650012.58
#'
#' # Value for North
#' North <- 5590735.41
#'
#' # East and North as data.frame
#' utm_df <- as.data.frame(cbind(East,North))
#'
#' # Zone
#' zone <- 18
#'
#' # Hemisphere
#' Hemisphere <- "south"
#'
#' value <- UTMtoLongLat(utm_df,zone,Hemisphere)
#' print(value)
UTMtoLongLat <- function(utm_df, zone, hemisphere) {
  CRSstring <- paste0("+proj=utm +zone=", zone, " +", hemisphere)
  utmcoor <- sp::SpatialPoints(utm_df, proj4string = sp::CRS(CRSstring))
  longlatcoor <- sp::spTransform(utmcoor, sp::CRS("+init=epsg:4326"))
  value <- as.data.frame(longlatcoor)
  names(value) <- c("Long", "Lat")
  return(value)
}
