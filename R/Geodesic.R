#' Geodesic
#'
#' To convert from Cartesian to Geodesic.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param XYZ_df Sexagesimal longitude and latitude as dataframe.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame
#' @export
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
#' # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
#' # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
#' # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
#' value <- geodesic(4, XYZ_df, digits = 4)
#' print(value)
geodesic <- function(a, XYZ_df, digits = 4){
#  Ellipsoids <- NULL
  x <- as.numeric(XYZ_df[,2])
  y <- as.numeric(XYZ_df[,3])
  z <- as.numeric(XYZ_df[,4])
  d <- as.numeric(sqrt(x^2+y^2))
  lat <- as.numeric(atan((z+as.numeric(Ellipsoids[a,5])*as.numeric(Ellipsoids[a,7])*sin(atan((as.numeric(Ellipsoids[a,2])*z)/(as.numeric(Ellipsoids[a,5])*sqrt(x^2+y^2))))^3)/((sqrt(x^2+y^2))-as.numeric(Ellipsoids[a,2])*as.numeric(Ellipsoids[a,6])*cos(atan((as.numeric(Ellipsoids[a,2])*z)/(as.numeric(Ellipsoids[a,5])*sqrt(x^2+y^2))))^3)))
  N <- as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(lat)^2)
  lon <- as.numeric(atan(y/x))
  H <- as.numeric((d/cos(lat))-N)
  values <- as.data.frame(cbind(XYZ_df[,1],round(lat*180/pi, digits), round(lon*180/pi, digits), round(H, digits)))
  names(values) <- c("Pt", "Lat", "Lon", "H")
  return(values)
}
