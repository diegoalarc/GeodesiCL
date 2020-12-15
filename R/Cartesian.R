#' Cartesian
#'
#' To convert from Geodesic to Cartesian.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param b ELLIPSOIDAL HEIGHT.
#' @param c Radian longitude.
#' @param d Radian Latitude.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' # Longitude
#' g <- -71
#' m <- 18
#' s <- 44.86475
#'
#' # Value in radians
#' rad_long <- radians(g,m,s)
#'
#' # Latitude
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' # Value in radians
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # ELLIPSOIDAL HEIGHT (h)
#' h <- 31.885
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- cartesian(4, h, rad_long, rad_lat, digits = 4)
#' print(value)
cartesian <- function(a, b, c, d, digits = 4){
#  Ellipsoids <- NULL
  valueX <- (as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2)+b)*cos(d)*cos(c)
  valueY <- (as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2)+b)*cos(d)*sin(c)
  valueZ <- ((as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2))*(1 - as.numeric(Ellipsoids[a,6]))+b)*sin(d)
  values <- data.frame(round(valueX,digits), round(valueY,digits), round(valueZ,digits))
  names(values) <- c("X", "Y", "Z")
  return(values)
}
