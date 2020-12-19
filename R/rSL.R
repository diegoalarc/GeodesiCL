#' To calculate the value of r, S and L.
#'
#' With this function it is possible to calculate the value of r, S and L.
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param pto_lat Point name and the latitude in radians as data.frame.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame with the data in the following order: "Pt", "r", "S", "L".
#' @export
#'
#' @examples
#' # Point name
#' Pto <- "St1"
#'
#' # Latitude
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # Ellipsoidal height and Horizontal distance as data.frame
#' pto_lat <- data.frame(Pto, rad_lat)
#'
#' # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
#' # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
#' # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
#' value <- rSL(4, pto_lat, digits = 4)
#' print(value)
rSL <- function(x, pto_lat, digits = 4){
  y <- as.numeric(pto_lat[,2])
  r <- as.numeric(Ellipsoids[x,2])/sqrt(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)*cos(y)
  S <- (as.numeric(Ellipsoids[x,2])*(1 - as.numeric(Ellipsoids[x,6]))/(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)^(3/2))*y
  L <- (as.numeric(Ellipsoids[x,2])/sqrt(1 - as.numeric(Ellipsoids[x,6])*sin(y)^2)*cos(y))*y
  values <- data.frame(pto_lat[,1], round(r, digits), round(S, digits), round(L, digits))
  names(values) <- c("Pt", "r", "S", "L")
  return(values)
}
