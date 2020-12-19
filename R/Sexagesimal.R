#' To convert separated data in Degrees Minutes and Seconds to Decimal degrees.
#'
#' With this function it is possible to convert separated data in Degrees Minutes and Seconds to Decimal degrees.
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
#' # Latitude
#' g <- -33
#' m <- 38
#' s <- 30.123456
#' value <- sexagesimal(g, m, s, digits = 4)
#' print(value)
sexagesimal <- function(x, y, z, digits = 4){
  value <- as.numeric(x-(y/60)-(z/3600))
  return(round(value, digits))
}

