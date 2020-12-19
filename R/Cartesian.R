#' To convert from Geographic coordinate to Cartesian coordinate.
#'
#' With this function it is possible to convert from Geographic coordinate to Cartesian coordinate and obtain the decimal precision that you assign.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param longlat_df Point name, Sexagesimal longitude and latitude as dataframe.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame with the data in the following order: "Pt", "X", "Y", "Z".
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
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- cartesian(4, longlat_df, digits = 4)
#' print(value)
cartesian <- function(a, longlat_df, digits = 4){
  b <- as.numeric(longlat_df[,4])
  c <- as.numeric((longlat_df[,2])*pi/180)
  d <- as.numeric((longlat_df[,3])*pi/180)
  valueX <- (as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2)+b)*cos(d)*cos(c)
  valueY <- (as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2)+b)*cos(d)*sin(c)
  valueZ <- ((as.numeric(Ellipsoids[a,2])/sqrt(1 - as.numeric(Ellipsoids[a,6])*sin(d)^2))*(1 - as.numeric(Ellipsoids[a,6]))+b)*sin(d)
  values <- data.frame(longlat_df[,1], round(valueX, digits), round(valueY, digits), round(valueZ, digits))
  names(values) <- c("Pt", "X", "Y", "Z")
  return(values)
}
