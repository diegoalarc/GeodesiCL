#' Cartesian
#'
#' To convert from Geodesic to Cartesian.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param longlat_df Sexagesimal longitude and latitude as dataframe.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' # Point name
#' Pto <- "St1"
#'
#' # Longitude
#' g <- -71
#' m <- 18
#' s <- 44.86475
#'
#' # Value in radians
#' rad_long <- radians(g,m,s)
#'
#' # Latitude
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' # Value in radians
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # ELLIPSOIDAL HEIGHT (h)
#' h <- 31.885
#'
#' # Longitude and Latitude as data.frame
#' longlat_df <- as.data.frame(cbind(Pto, rad_long, rad_lat, h))
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- cartesian(4, longlat_df, digits = 4)
#' print(value)
cartesian <- function(a, longlat_df, digits = 4){
#  Ellipsoids <- NULL
  b <- as.numeric(longlat_df[,4])
  c <- as.numeric(longlat_df[,2])
  d <- as.numeric(longlat_df[,3])
  valueX <- (as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2)+b)*cos(d)*cos(c)
  valueY <- (as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2)+b)*cos(d)*sin(c)
  valueZ <- ((as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2))*(1 - as.numeric(Ellipsoids[a,6]))+b)*sin(d)
  values <- as.data.frame(cbind(longlat_df[,1],round(valueX,digits), round(valueY,digits), round(valueZ,digits)))
  names(values) <- c("Pt", "X", "Y", "Z")
  return(values)
}
