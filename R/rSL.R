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
#' # To know the ellipsoids and the order open the Ellipsoids in the package and look for it number
#' Ellip <- Ellipsoids
#' #View(Ellip)
#'
#' # We choose the number 47 which is WGS84
#' value <- rSL(47, pto_lat, digits = 4)
#' print(value)
rSL <- function(x, pto_lat, digits = 4){
  y <- as.numeric(pto_lat[,2])
  r <- as.numeric(Ellipsoids[x,3])/sqrt(1 - as.numeric(Ellipsoids[x,7])*sin(y)^2)*cos(y)
  S <- (as.numeric(Ellipsoids[x,3])*(1 - as.numeric(Ellipsoids[x,7]))/(1 - as.numeric(Ellipsoids[x,7])*sin(y)^2)^(3/2))*y
  L <- (as.numeric(Ellipsoids[x,3])/sqrt(1 - as.numeric(Ellipsoids[x,7])*sin(y)^2)*cos(y))*y
  values <- tibble::as_tibble(data.frame(pto_lat[,1], round(r, digits), round(S, digits), round(L, digits)))
  names(values) <- c("Pt", "r", "S", "L")
  return(values)
}
