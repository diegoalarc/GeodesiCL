#' To convert separated data in Degrees Minutes and Seconds to Radians.
#'
#' With this function it is possible to convert separated data in Degrees Minutes and Seconds to Radians.
#'
#' @param x Value of Degree in Latitude or Longitude.
#' @param y Value of Minute in Latitude or Longitude.
#' @param z Value of Seconds in Latitude or Longitude.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#' value <- radians(g, m, s, digits = 4)
#' print(value)
radians <- function(x, y, z, digits = 4){
  value <- (x-(y/60)-(z/3600))*pi/180
  return(round(value, digits))
}
