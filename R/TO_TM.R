#' TO_TM
#'
#' Geodesic coordinate transformation to TM
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param b Sexagesimal latitude.
#' @param c Sexagesimal longitude.
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
#' # Lat
#' g <- -33
#' m <- 12
#' s <- 27.11457
#'
#' # Value in radians
#' sexa_lat <- sexagesimal(g, m, s)
#'
#' # Lon
#' g1 <- -71
#' m1 <- 18
#' s1 <- 44.86475
#'
#' # Value in radians
#' sexa_lon <- sexagesimal(g1, m1, s1)
#'
#' # ELLIPSOIDAL HEIGHT (h)
#' h <- 31.885
#'
#' value <- TO_TM(4, sexa_lat, sexa_lon, CM, SC_FACTOR_Ko, FE, FN)
#' print(value)
TO_TM <- function(a,b,c,d,e,f,g){
  N <- as.numeric(Ellipsoids[a,2])/sqrt(1-as.numeric(Ellipsoids[a,6])*sin(b*pi/180)^2)
  DELTA_LAMBA <- (c-d)*3600
  a1 <- as.numeric(Ellipsoids[a,14])*b
  b1 <- as.numeric(Ellipsoids[a,15])*sin(2*(b*pi/180))
  c1 <- as.numeric(Ellipsoids[a,16])*sin(4*(b*pi/180))
  d1 <- as.numeric(Ellipsoids[a,17])*sin(6*(b*pi/180))
  e1 <- as.numeric(Ellipsoids[a,18])*sin(8*(b*pi/180))
  f1 <- as.numeric(Ellipsoids[a,19])*sin(10*(b*pi/180))
  Be <- a1-b1+c1-d1+e1-f1
  t <- tan(b*pi/180)
  n <- sqrt(as.numeric(Ellipsoids[a,7]))*cos(b*pi/180)
  N1 <- (1/2)*(DELTA_LAMBA^2)*N*sin(b*pi/180)*cos(b*pi/180)*(Sin_1^2)
  N2 <- (1/24)*(DELTA_LAMBA^4)*N*sin(b*pi/180)*(cos(b*pi/180)^3)*(Sin_1^4)*(5-(t^2)+(9*n^2)+(4*(n^4)))
  N3 <- (1/720)*(DELTA_LAMBA^6)*N*sin(b*pi/180)*(cos(b*pi/180)^5)*(Sin_1^6)*(61-(58*(t^2))+(720*(n^2))-(350*(t^2)*(n^2)))
  Y <- e*(N1+N2+N3+Be)
  North <- Y+g
  E1 <- DELTA_LAMBA*N*cos(b*pi/180)*Sin_1
  E2 <- (1/6)*(DELTA_LAMBA^3)*N*(cos(b*pi/180)^3)*(Sin_1^3)*(1-(t^2)+(n^2))
  E3 <- (1/120)*(DELTA_LAMBA^5)*N*(cos(b*pi/180)^5)*(Sin_1^5)*(5-(18*(t^2))+(t^4)+(14*(n^2))-(58*(t^2)*(n^2)))
  X <- e*(E1+E2+E3)
  East <- X+f
  values <- data.frame(as.numeric(East), as.numeric(North), as.numeric(X), as.numeric(Y))
  names(values) <- c("East", "North", "X", "Y")
  return(values)
}
