#' Cartesian
#'
#' To convert from Geodesic to Cartesian.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param b ELLIPSOIDAL HEIGHT.
#' @param c Radian Latitude.
#' @param d Radian longitude.
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' Value in radians
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # Lon
#' g <- -71
#' m <- 18
#' s <- 44.86475
#'
#' Value in radians
#' rad_lon <- radians(g,m,s)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- cartesian(4,h, rad_lat, rad_lon)
#' print(value)
cartesian <- function(a,b,c,d){
  valueX <- (as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(c)^2)+b)*cos(c)*cos(d)
  valueY <- (as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(c)^2)+b)*cos(c)*sin(d)
  valueZ <- ((as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(c)^2))*(1 - as.numeric(Elipsoide[a,6]))+b)*sin(c)
  values <- data.frame(valueX, valueY, valueZ)
  names(values) <- c("X", "Y", "Z")
  return(values)
}
