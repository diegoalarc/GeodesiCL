#' Geodesic
#'
#' To convert from Cartesian to Geodesic.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param x Cartesian x value.
#' @param y Cartesian y value.
#' @param z Cartesian z value.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame
#' @export
#'
#' @examples
#' # Cartesian data
#' x <- 1711591.78090565
#' y <- -5060304.1659587
#' z <- -3473256.69328603
#'
#' # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
#' # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
#' # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
#' value <- geodesic(4, x, y, z)
#' print(value)
geodesic <- function(a, x, y, z, digits = 4){
#  Ellipsoids <- NULL
  d <- as.numeric(sqrt(x^2+y^2))
  lat <- as.numeric(atan((z+as.numeric(Ellipsoids[a,5])*as.numeric(Ellipsoids[a,7])*sin(atan((as.numeric(Ellipsoids[a,2])*z)/(as.numeric(Ellipsoids[a,5])*sqrt(x^2+y^2))))^3)/((sqrt(x^2+y^2))-as.numeric(Ellipsoids[a,2])*as.numeric(Ellipsoids[a,6])*cos(atan((as.numeric(Ellipsoids[a,2])*z)/(as.numeric(Ellipsoids[a,5])*sqrt(x^2+y^2))))^3)))
  N <- as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(lat)^2)
  lon <- as.numeric(atan(y/x))
  H <- as.numeric((d/cos(lat))-N)
  values <- data.frame(round(lat*180/pi, digits), round(lon*180/pi, digits), round(H, digits))
  names(values) <- c("Lat", "Lon", "H")
  return(values)
}
