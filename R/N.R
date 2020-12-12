#' N
#'
#' To calculate the value of N
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
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- N(4, rad_lat)
#' print(value)
N <- function(x, y){
#  Ellipsoids <- NULL
  value <- as.numeric(Ellipsoids[x,2])/sqrt(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)
  return(value)
}
