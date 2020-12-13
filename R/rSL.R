#' rSL
#'
#' To calculate the value of r, S and L.
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param y Latitude in radians
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
#' value <- rSL(4, rad_lat)
#' print(value)
rSL <- function(x, y){
#  Ellipsoids <- NULL
  r <- as.numeric(Ellipsoids[x,2])/sqrt(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)*cos(y)
  S <- (as.numeric(Ellipsoids[x,2])*(1 - as.numeric(Ellipsoids[x,6]))/(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)^(3/2))*y
  L <- (as.numeric(Ellipsoids[x,2])/sqrt(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)*cos(y))*y
  values <- data.frame(r, S, L)
  names(values) <- c("r", "S", "L")
  return(values)
}
