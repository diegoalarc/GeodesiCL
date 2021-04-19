#' To convert from Geographic coordinate to Cartesian coordinate.
#'
#' With this function it is possible to convert from Geographic coordinate to Cartesian coordinate and obtain the decimal precision that you assign.
#'
#' @param a Selection of Ellipsoid.
#' @param longlat_df Point name, Sexagesimal longitude and latitude as dataframe.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame with the data in the following order: "Pt", "X", "Y", "Z".
#' @export
#'
#' @note create data frame of epsg codes by epsg <- rgdal::make_EPSG()
#'
#' @references https://github.com/OSGeo/PROJ & https://github.com/cran/rgdal
#'
#' @examples
#' \donttest{
#' # Point name
#' Pto <- "St1"
#'
#' # Longitude
#' g <- -71
#' m <- 18
#' s <- 44.86475
#'
#' # Value in sexagesimal
#' sexa_long <- sexagesimal(g,m,s)
#'
#' # Latitude
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' # Value in sexagesimal
#' sexa_lat <- sexagesimal(g, m, s)
#' print(sexa_lat)
#'
#' # ELLIPSOIDAL HEIGHT (h)
#' h <- 31.885
#'
#' # Longitude and Latitude as data.frame
#' longlat_df <- data.frame(Pto, sexa_long, sexa_lat, h)
#'
#' # To know the ellipsoids and the order open the Ellipsoids in the package and look for it number
#' Ellip <- Ellipsoids
#' #View(Ellip)
#'
#' # We choose the number 5 which is GRS80
#' value <- cartesian(5, longlat_df, digits = 4)
#' print(value)
#' }
cartesian <- function(a, longlat_df, digits = 4){
  b <- as.numeric(longlat_df[,4])
  c <- as.numeric((longlat_df[,2])*pi/180)
  d <- as.numeric((longlat_df[,3])*pi/180)
  valueX <- (as.numeric(Ellipsoids[a,3])/sqrt(1 - as.numeric(Ellipsoids[a,7])*sin(d)^2)+b)*cos(d)*cos(c)
  valueY <- (as.numeric(Ellipsoids[a,3])/sqrt(1 - as.numeric(Ellipsoids[a,7])*sin(d)^2)+b)*cos(d)*sin(c)
  valueZ <- ((as.numeric(Ellipsoids[a,3])/sqrt(1 - as.numeric(Ellipsoids[a,7])*sin(d)^2))*(1 - as.numeric(Ellipsoids[a,7]))+b)*sin(d)
  values <- tibble::as_tibble(as.data.frame(cbind(longlat_df[,1], round(valueX, digits), round(valueY, digits), round(valueZ, digits))))
  names(values) <- c("Pt", "X", "Y", "Z")
  return(values)
}
