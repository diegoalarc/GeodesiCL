#' UTMtoLongLat
#'
#' To convert from UTM to Longitude and Latitude.
#'
#' @param utm_df East and North UTM in a data.frame.
#' @param zone Select UTM zone to work.
#' @param hemisphere select between north or south (written in lowercase).
#'
#' @return data.frame
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
#' utm_df <- as.data.frame(cbind(Pto,East,North))
#'
#' # Zone
#' zone <- 18
#'
#' # Hemisphere could be "north" or "south"
#' Hemisphere <- "south"
#'
#' value <- UTMtoLongLat(utm_df,zone,Hemisphere)
#' print(value)
UTMtoLongLat <- function(utm_df, zone, hemisphere) {


  df <- data.frame(East = as.numeric(utm_df[,2]), North = as.numeric(utm_df[,3]))
  sp::coordinates(df) <- c("East", "North")

  CRSstring <- paste0(
    "+proj=utm +zone=", zone,
    " +ellps=WGS84",
    " +", hemisphere,
    " +units=m",
    " +datum=WGS84")

  sp::proj4string(df) <- sp::CRS(CRSstring)

  res <- sp::spTransform(df, sp::CRS("+init=epsg:4326")) %>%
    data.frame()
  value <- as.data.frame(cbind(utm_df[,1],res))
  names(value) <- c("Pt","East", "North")
  return(value)
}
