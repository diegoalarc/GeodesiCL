#' TO_TM
#'
#' Geodesic coordinate transformation to TM
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param b Sexagesimal longitude.
#' @param c Sexagesimal latitude.
#' @param d Central meridian.
#' @param e Scale factor Ko.
#' @param f False East (FE).
#' @param g False North (FN).
#'
#' @return value
#' @export
#'
#' @examples
#' # Test data
#' CM <- -69.00000
#' SC_FACTOR_Ko <- 0.99960
#' FE <- 500000.00000
#' FN <- 10000000.00000
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
#' # ELLIPSOIDAL HEIGHT (h)
#' h <- 31.885
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- TO_TM(4, sexa_long, sexa_lat, CM, SC_FACTOR_Ko, FE, FN)
#' print(value)
TO_TM <- function(a, b, c, d, e, f, g){
  #  Ellipsoids <- NULL
  #  Sin_1 <- NULL
  N <- as.numeric(Ellipsoids[a,2])/sqrt(1-as.numeric(Ellipsoids[a,6])*sin(c*pi/180)^2)
  DELTA_LAMBA <- (b-d)*3600
  a1 <- as.numeric(Ellipsoids[a,14])*c
  b1 <- as.numeric(Ellipsoids[a,15])*sin(2*(c*pi/180))
  c1 <- as.numeric(Ellipsoids[a,16])*sin(4*(c*pi/180))
  d1 <- as.numeric(Ellipsoids[a,17])*sin(6*(c*pi/180))
  e1 <- as.numeric(Ellipsoids[a,18])*sin(8*(c*pi/180))
  f1 <- as.numeric(Ellipsoids[a,19])*sin(10*(c*pi/180))
  Be <- a1-b1+c1-d1+e1-f1
  t <- tan(c*pi/180)
  n <- sqrt(as.numeric(Ellipsoids[a,7]))*cos(c*pi/180)
  N1 <- 1/2*DELTA_LAMBA^2*N*sin(c*pi/180)*cos(c*pi/180)*(Sin_1^2)
  N2 <- 1/24*DELTA_LAMBA^4*N*sin(c*pi/180)*cos(c*pi/180)^3*(Sin_1^4)*(5-t^2+9*n^2+4*n^4)
  N3 <- 1/720*DELTA_LAMBA^6*N*sin(c*pi/180)*cos(c*pi/180)^5*(Sin_1^6)*(61-58*t^2+720*n^2-350*t^2*n^2)
  Y <- e*(Be+N1+N2+N3)
  North <- Y+g
  E1 <- DELTA_LAMBA*N*cos(c*pi/180)*Sin_1
  E2 <- 1/6*DELTA_LAMBA^3*N*cos(c*pi/180)^3*Sin_1^3*(1-t^2+n^2)
  E3 <- 1/120*DELTA_LAMBA^5*N*cos(c*pi/180)^5*Sin_1^5*(5-18*t^2+t^4+14*n^2-58*t^2*n^2)
  X <- e*(E1+E2+E3)
  East <- X+f
  values <- data.frame(as.numeric(East), as.numeric(North), as.numeric(X), as.numeric(Y))
#                     , as.numeric(DELTA_LAMBA), as.numeric(a1), as.numeric(b1), as.numeric(c1)
#                     , as.numeric(d1), as.numeric(e1), as.numeric(f1), as.numeric(Be), as.numeric(t)
#                     , as.numeric(n), as.numeric(N1), as.numeric(N2), as.numeric(N3), as.numeric(E1)
#                     , as.numeric(E2), as.numeric(E3))
# names(values) <- c("East", "North", "X", "Y", "DELTA_LAMBA","a1", "b1", "c1", "d1", "e1", "f1", "B", "t", "n", "N1", "N2", "N3", "E1", "E2", "E3")
  names(values) <- c("East", "North", "X", "Y")
  return(values)
}
