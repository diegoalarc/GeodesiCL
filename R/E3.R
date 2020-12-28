#' To calculate 1-e^2*sen(lat)^2.
#'
#' To calculate the value for the function 1-e^2*sen(lat)^2.
#'
#' @param x Selection of Ellipsoid.
#' @param y Latitude in radians.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @note create data frame of epsg codes by epsg <- rgdal::make_EPSG()
#'
#' @references https://github.com/OSGeo/PROJ & https://github.com/cran/rgdal
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # To know the ellipsoids and the order open the Ellipsoids in the package and look for it number
#' Ellip <- Ellipsoids
#' #View(Ellip)
#'
#' # We choose the number 5 which is GRS80
#' value <- E3(5, rad_lat, digits = 4)
#' print(value)
E3 <- function(x, y, digits = 4){
  value <- (1 - as.numeric(Ellipsoids[x,7])*sin(y)^2)
  return(round(value, digits))
}
