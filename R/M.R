#' M
#'
#' To calculate the value of M.
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80', 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880', 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'.
#' @param y Latitude in radians.
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
#'
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
#' # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
#' # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
#' value <- M(4, rad_lat, digits = 4)
#' print(value)
M <- function(x, y, digits = 4){
#  Ellipsoids <- NULL
  value <- (as.numeric(Ellipsoids[x,2])*(1 - as.numeric(Ellipsoids[x,6]))/(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)^(3/2))
  return(round(value, digits))
}
