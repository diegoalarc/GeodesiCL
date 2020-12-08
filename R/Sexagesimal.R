#' Sexagesimal
#'
#' Convert separated data in Degrees Minutes and Seconds to Decimal degrees.
#'
#' @param x Value of Degree in Latitude or Longitude.
#' @param y Value of Minute in Latitude or Longitude.
#' @param z Value of Seconds in Latitude or Longitude.
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#' value <- sexagesimal(g, m, s)
#' print(value)
sexagesimal <- function(x,y,z){
  x-(y/60)-(z/3600)
}

