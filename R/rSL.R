#' rSL
#'
#' To calculate the value of r, S and L
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
#' value <- radians(g, m, s)
#' print(value)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value1 <- rSL(4, value)
#' print(value1)
rSL <- function(x, y){
#  Ellipsoids <- NULL
  r <- as.numeric(Ellipsoids[x,2])/sqrt(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)*cos(y)
  S <- (as.numeric(Ellipsoids[x,2])*(1 - as.numeric(Ellipsoids[x,6]))/(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)^(3/2))*y
  L <- (as.numeric(Ellipsoids[x,2])/sqrt(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)*cos(y))*y
  values <- data.frame(r, S, L)
  names(values) <- c("r", "S", "L")
  return(values)
}
