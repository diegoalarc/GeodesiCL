#' E3
#'
#' To calculate 1-e^2*sen(lat)^2
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param y Latitude in radians.
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
#' value <- radians(g, m, s)
#' print(value)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value1 <- E3(4, value)
#' print(value1)
E3 <- function(x,y){
  value <- (1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)
  return(value)
}
