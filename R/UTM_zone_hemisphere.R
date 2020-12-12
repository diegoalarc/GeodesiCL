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
#' #' # Longitude
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
#' value <- UTM_zone_hemisphere(sexa_long, sexa_lat)
#' print(value)
UTM_zone_hemisphere <- function(x, y) {
  value1 <- (floor((x + 180) / 6) %% 60) + 1
  value2 <- ifelse(y > 0, "north", "south")
  value3 <- paste0(value1," +",value2)
  return(value3)
}
