#' Lat_lon_height
#'
#' To convert from Cartesian to Geodesic.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param x Cartesian x value.
#' @param y Cartesian y value.
#' @param z Cartesian z value.
#'
#' @return value
#' @export
#'
#' @examples
#' # Cartesian data
#' x <- 1711591.78090565
#' y <- -5060304.1659587
#' z <- -3473256.69328603
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- Lat_lon_height(4,x,y,z)
#' print(value)
Lat_lon_height <- function(a,x,y,z){
  d <- sqrt(x^2+y^2)
  lon <- atan(y/x)
  lat <- atan((z+as.numeric(Elipsoide[a,5])*as.numeric(Elipsoide[a,7])*sin(atan((as.numeric(Elipsoide[a,2])*z)/(as.numeric(Elipsoide[a,5])*sqrt(x^2+y^2))))^3)/((sqrt(x^2+y^2))-as.numeric(Elipsoide[a,2])*as.numeric(Elipsoide[a,6])*cos(atan((as.numeric(Elipsoide[a,2])*z)/(as.numeric(Elipsoide[a,5])*sqrt(x^2+y^2))))^3))
  N <- as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(lat)^2)
  H <- (d/cos(lat))-N
  values <- data.frame(as.numeric(lat), as.numeric(lon), as.numeric(H))
  names(values) <- c("lat", "lon", "H")
  return(values)
}
