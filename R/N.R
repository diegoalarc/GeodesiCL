#' To calculate the value of N.
#'
#' To calculate the value for the function of N.
#'
#' @param x Selection of Ellipsoid.
#' @param y Latitude in radians.
#' @param digits Number of digits are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @note create data frame of epsg codes by epsg <- rgdal::make_EPSG()
#'
#' @references https://github.com/OSGeo/PROJ & https://github.com/cran/rgdal
#'
#' @examples
#' \donttest{
#' # Latitude
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # To know the ellipsoids and the order open the Ellipsoids in the package
#' # and look for it number
#' Ellip <- Ellipsoids
#' #View(Ellip)
#'
#' # We choose the number 5 which is GRS80
#' value <- N(5, rad_lat, digits = 4)
#' print(value)
#' }
N <- function(x, y, digits = 4){
  value <- as.numeric(Ellipsoids[x,3])/sqrt(1 - as.numeric(Ellipsoids[x,7])*
                                              sin(y)^2)
  return(round(value, digits))
}
