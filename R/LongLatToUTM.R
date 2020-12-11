#' LongLatToUTM
#'
#' To convert from Longitude and Latitude to UTM
#'
#' @param x Sexagesimal longitude.
#' @param y Sexagesimal latitude.
#' @param units Select units for UTM to work.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 12
#' s <- 27.11457
#'
#' # Value in sexagesimal
#' sexa_lat <- sexagesimal(g, m, s)
#'
#' # Lon
#' g1 <- -71
#' m1 <- 18
#' s1 <- 44.86475
#'
#' # Value in sexagesimal
#' sexa_lon <- sexagesimal(g1, m1, s1)
#'
#' value <- LongLatToUTM(sexa_lon, sexa_lat, units = 'm')
#' print(value)
LongLatToUTM <- function(x, y, units = 'm') {

  df <- data.frame(long = x, lat = y)
  sp::coordinates(df) <- c("long", "lat")

  hemisphere <- ifelse(y > 0, "north", "south")
  zone <- (floor((x + 180) / 6) %% 60) + 1

  sp::proj4string(df) <- sp::CRS("+init=epsg:4326")
  CRSstring <- paste0(
    "+proj=utm +zone=", zone,
    " +ellps=WGS84",
    " +", hemisphere,
    " +units=", units)
  if (dplyr::n_distinct(CRSstring) > 1L)
    stop("multiple zone/hemisphere detected")

  res <- sp::spTransform(df, sp::CRS(CRSstring[1L])) %>%
    data.frame() %>%
    dplyr::mutate(zone = zone, hemisphere = hemisphere)
  res
  return(res)
}
