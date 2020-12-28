#' To calculate 1-e^2.
#'
#' To calculate the value for the function 1-e^2.
#'
#' @param x Selection of Ellipsoid.
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
#' # To know the ellipsoids and the order open the Ellipsoids in the package and look for it number
#' Ellip <- Ellipsoids
#' #View(Ellip)
#'
#' # We choose the number 5 which is GRS80
#' value <- E2(5, digits = 4)
#' print(value)
E2 <- function(x, digits = 4){
  value <- 1 - as.numeric(Ellipsoids[x,7])
  return(round(value, digits))
}
