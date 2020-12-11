#' UTM_zone_hemisphere
#'
#' To find from Longitude and Latitude the UTM zone.
#'
#' @param x Sexagesimal longitude.
#' @param y Sexagesimal latitude.
#'
#' @return value
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
#' value <- UTM_zone_hemisphere(sexa_lon, sexa_lat)
#' print(value)
UTM_zone_hemisphere <- function(x, y) {
  value1 <- (floor((x + 180) / 6) %% 60) + 1
  value2 <- ifelse(y > 0, "north", "south")
  value3 <- paste0(value1," +",value2)
  return(value3)
}
