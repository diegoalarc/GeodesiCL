#' To convert from Geographic coordinate to TM.
#'
#' With this function it is possible to convert from Geographic coordinate to TM using the Central meridian, Scale factor Ko, False East, False North and obtain the decimal precision that you assign.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param longlat_df Sexagesimal longitude and latitude as dataframe.
#' @param d Central meridian.
#' @param e Scale factor Ko.
#' @param f False East (FE).
#' @param g False North (FN).
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame with the data in the following order: "East", "North", "X", "Y".
#' @export
#'
#' @examples
#' # Test data
#' CM <- -69.00000
#' SC_FACTOR_Ko <- 0.99960
#' FE <- 500000.00000
#' FN <- 10000000.00000
#'
#' # Point name
#' Pto <- "St1"
#'
#' # Longitude
#' g <- -71
#' m <- 18
#' s <- 44.86475
#'
#' # Value in sexagesimal
#' sexa_long <- sexagesimal(g, m, s)
#'
#' # Latitude
#' g1 <- -33
#' m1 <- 12
#' s1 <- 27.11457
#'
#' # Value in sexagesimal
#' sexa_lat <- sexagesimal(g1, m1, s1)
#'
#' # Longitude and Latitude as data.frame
#' longlat_df <- as.data.frame(cbind(Pto,sexa_long,sexa_lat))
#'
#' # ELLIPSOIDAL HEIGHT (h)
#' h <- 31.885
#'
#' # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
#' # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
#' # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
#' value <- TO_TM(4, longlat_df, CM, SC_FACTOR_Ko, FE, FN, digits = 4)
#' print(value)
TO_TM <- function(a, longlat_df, d, e, f, g, digits = 4){
  #  Ellipsoids <- NULL
  #  Sin_1 <- NULL
  b <- as.numeric(longlat_df[,2])
  c <- as.numeric(longlat_df[,3])
  N <- as.numeric(Ellipsoids[a,2])/sqrt(1-as.numeric(Ellipsoids[a,6])*sin(c*pi/180)^2)
  DELTA_LAMBA <- as.numeric((b-d)*3600)
  a1 <- as.numeric(Ellipsoids[a,14])*c
  b1 <- as.numeric(Ellipsoids[a,15])*sin(2*(c*pi/180))
  c1 <- as.numeric(Ellipsoids[a,16])*sin(4*(c*pi/180))
  d1 <- as.numeric(Ellipsoids[a,17])*sin(6*(c*pi/180))
  e1 <- as.numeric(Ellipsoids[a,18])*sin(8*(c*pi/180))
  f1 <- as.numeric(Ellipsoids[a,19])*sin(10*(c*pi/180))
  Be <- as.numeric(a1-b1+c1-d1+e1-f1)
  t <- as.numeric(tan(c*pi/180))
  n <- as.numeric(sqrt(as.numeric(Ellipsoids[a,7]))*cos(c*pi/180))
  N1 <- as.numeric(1/2*DELTA_LAMBA^2*N*sin(c*pi/180)*cos(c*pi/180)*(Sin_1^2))
  N2 <- as.numeric(1/24*DELTA_LAMBA^4*N*sin(c*pi/180)*cos(c*pi/180)^3*(Sin_1^4)*(5-t^2+9*n^2+4*n^4))
  N3 <- as.numeric(1/720*DELTA_LAMBA^6*N*sin(c*pi/180)*cos(c*pi/180)^5*(Sin_1^6)*(61-58*t^2+720*n^2-350*t^2*n^2))
  Y <- as.numeric(e*(Be+N1+N2+N3))
  North <- as.numeric(Y+g)
  E1 <- as.numeric(DELTA_LAMBA*N*cos(c*pi/180)*Sin_1)
  E2 <- as.numeric(1/6*DELTA_LAMBA^3*N*cos(c*pi/180)^3*Sin_1^3*(1-t^2+n^2))
  E3 <- as.numeric(1/120*DELTA_LAMBA^5*N*cos(c*pi/180)^5*Sin_1^5*(5-18*t^2+t^4+14*n^2-58*t^2*n^2))
  X <- as.numeric(e*(E1+E2+E3))
  East <- as.numeric(X+f)
  values <- as.data.frame(cbind(round(East, digits), round(North, digits), round(X, digits), round(Y, digits)))
  names(values) <- c("East", "North", "X", "Y")
  return(values)
}
