#' Geodesic
#'
#' To convert from Cartesian to Geodesic.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param x Cartesian x value.
#' @param y Cartesian y value.
#' @param z Cartesian z value.
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
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- geodesic(4,x,y,z)
#' print(value)
geodesic <- function(a,x,y,z){
#  Ellipsoids <- NULL
  d <- sqrt(x^2+y^2)
  lat <- atan((z+as.numeric(Ellipsoids[a,5])*as.numeric(Ellipsoids[a,7])*sin(atan((as.numeric(Ellipsoids[a,2])*z)/(as.numeric(Ellipsoids[a,5])*sqrt(x^2+y^2))))^3)/((sqrt(x^2+y^2))-as.numeric(Ellipsoids[a,2])*as.numeric(Ellipsoids[a,6])*cos(atan((as.numeric(Ellipsoids[a,2])*z)/(as.numeric(Ellipsoids[a,5])*sqrt(x^2+y^2))))^3))
  N <- as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(lat)^2)
  lon <- atan(y/x)
  H <- (d/cos(lat))-N
  values <- data.frame(as.numeric(lat*180/pi), as.numeric(lon*180/pi), as.numeric(H))
  names(values) <- c("Lat", "Lon", "H")
  return(values)
}
