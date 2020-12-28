#' To convert from Cartesian coordinate to Geographic coordinate.
#'
#' With this function it is possible to convert from Cartesian coordinate to Geographic coordinate and obtain the decimal precision that you assign.
#'
#' @param a Selection of Ellipsoid.
#' @param XYZ_df Sexagesimal longitude and latitude as dataframe.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame with the data in the following order: "Pt", "Lat", "Lon", "H".
#' @export
#'
#' @note create data frame of epsg codes by epsg <- rgdal::make_EPSG()
#'
#' @references https://github.com/OSGeo/PROJ & https://github.com/cran/rgdal
#'
#' @examples
#' # Point name
#' Pto <- "St1"
#'
#' # Cartesian data
#' X <- 1711591.78090565
#' Y <- -5060304.1659587
#' Z <- -3473256.69328603
#'
#' # Pto, X, Y and Z as data.frame
#' XYZ_df <- as.data.frame(cbind(Pto, X, Y, Z))
#'
#' # To know the ellipsoids and the order open the Ellipsoids in the package and look for it number
#' Ellip <- Ellipsoids
#' #View(Ellip)
#'
#' # We choose the number 5 which is GRS80
#' value <- geodesic(5, XYZ_df, digits = 4)
#' print(value)
geodesic <- function(a, XYZ_df, digits = 4){
#  Ellipsoids <- NULL
  x <- as.numeric(XYZ_df[,3])
  y <- as.numeric(XYZ_df[,4])
  z <- as.numeric(XYZ_df[,5])
  d <- as.numeric(sqrt(x^2+y^2))
  lat <- as.numeric(atan((z+as.numeric(Ellipsoids[a,6])*as.numeric(Ellipsoids[a,8])*sin(atan((as.numeric(Ellipsoids[a,3])*z)/(as.numeric(Ellipsoids[a,6])*sqrt(x^2+y^2))))^3)/((sqrt(x^2+y^2))-as.numeric(Ellipsoids[a,3])*as.numeric(Ellipsoids[a,7])*cos(atan((as.numeric(Ellipsoids[a,3])*z)/(as.numeric(Ellipsoids[a,6])*sqrt(x^2+y^2))))^3)))
  N <- as.numeric(Ellipsoids[a,3])/sqrt(1 - as.numeric(Ellipsoids[a,7])*sin(lat)^2)
  lon <- as.numeric(atan(y/x))
  H <- as.numeric((d/cos(lat))-N)
  values <- tibble::as_tibble(as.data.frame(cbind(XYZ_df[,1],round(lat*180/pi, digits), round(lon*180/pi, digits), round(H, digits))))
  names(values) <- c("Pt", "Lat", "Lon", "H")
  return(values)
}
