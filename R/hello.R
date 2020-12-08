#' @name Ellipsoids
#'
#' @description Contains the values for conversion of the Ellipsoids 'PSAD-56', 'SAD-69', 'WGS-84', 'GRS-80 (SIRGAS)'.
#'
#' @format A \code{data.frame} with 19 columns, which are:
#' \describe{
#' \item{Ellipsoids}{Contains the names of each ellipsoid.}
#' \item{a}{Semi major axis of each ellipsoid.}
#' \item{1/f}{1/Flattening of each ellipsoid.}
#' \item{f}{Flattening of each ellipsoid.}
#' \item{b}{Semi minor axis of each ellipsoid.}
#' \item{e^2}{1st eccentricity squared of each ellipsoid.}
#' \item{e´^2}{2nd eccentricity squared of each ellipsoid.}
#' \item{A}{A Constant.}
#' \item{B}{B Constant.}
#' \item{C}{C Constant.}
#' \item{D}{D Constant.}
#' \item{E}{E Constant.}
#' \item{F}{F Constant.}
#' \item{Alfa}{Alfa Constant.}
#' \item{Beta}{Beta Constant.}
#' \item{Gamma}{Gamma Constant.}
#' \item{Delta}{Delta Constant.}
#' \item{Epsilon}{Epsilon Constant.}
#' \item{Zeta}{Zeta Constant.}
#' }
"Ellipsoids"

#' @name Sin 1"
#'
#' @description Contains the values of sin 1".
#'
#' @format A \code{numeric} with the value of sin 1"., which is:
#' \describe{
#' \item{Sin_1}{Value of sin 1".}
#' }
"Sin_1"

#' @name Sexagesimal
#'
#' @description Convert separated data in Degrees Minutes and Seconds to Decimal degrees.
#'
#' @param x Value of Degree in Latitude or Longitude.
#' @param y Value of Minute in Latitude or Longitude.
#' @param z Value of Seconds in Latitude or Longitude.
#'
#' @return value
#' @export
#'
#' @examples
#' #' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#' value <- sexagesimal(g, m, s)
#' print(value)
sexagesimal <- function(x,y,z){
  value <- x-(y/60)-(z/3600)
  return(value)
}

#' @name Radians
#'
#' @description Convert separated data in Degrees Minutes and Seconds to Radians.
#'
#' @param x Value of Degree in Latitude or Longitude.
#' @param y Value of Minute in Latitude or Longitude.
#' @param z Value of Seconds in Latitude or Longitude.
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#' value <- radians(g, m, s)
#' print(value)
radians <- function(x,y,z){
  value <- (x-(y/60)-(z/3600))*pi/180
  return(value)
}

#' @name 1-e^2
#'
#' @description To calculate (1-e^2)
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#'
#' @return value
#' @export
#'
#' @examples
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- E2(4)
#' print(value)
E2 <- function(x){
  value <- 1 - as.numeric(Elipsoide[x,6])
  return(value)
}

#' @name 1-e^2*sen(lat)^2
#'
#' @description To calculate 1-e^2*sen(lat)^2
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param y Latitude in radians.
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' value <- radians(g, m, s)
#' print(value)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value1 <- E3(4, value)
#' print(value1)
E3 <- function(x,y){
  value <- (1 - as.numeric(Elipsoide[x,6])*sin(y)^2)
  return(value)
}

#' @name Value of M
#'
#' @description To calculate the value of M
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param y Latitude in radians
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' value <- radians(g, m, s)
#' print(value)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value1 <- M(4, value)
#' print(value1)
M <- function(x,y){
  value <- as.numeric(Elipsoide[x,2])*(1 - as.numeric(Elipsoide[x,6]))/(1 - as.numeric(Elipsoide[x,6])*sin(y)^2)^(3/2)
  return(value)
}

#' @name Value of N
#'
#' @description To calculate the value of N
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param y Latitude in radians
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' value <- radians(g, m, s)
#' print(value)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value1 <- N(4, value)
#' print(value1)
N <- function(x,y){
  value <- as.numeric(Elipsoide[x,2])/sqrt(1 - as.numeric(Elipsoide[x,6])*sin(y)^2)
  return(value)
}

#' @name Value of r, S & L
#'
#' @description To calculate the value of r, S and L
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param y Latitude in radians
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' value <- radians(g, m, s)
#' print(value)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value1 <- rSL(4, value)
#' print(value1)
rSL <- function(x,y){
  r <- as.numeric(Elipsoide[x,2])/sqrt(1 - as.numeric(Elipsoide[x,6])*sin(y)^2)*cos(y)
  S <- (as.numeric(Elipsoide[x,2])*(1 - as.numeric(Elipsoide[x,6]))/(1 - as.numeric(Elipsoide[x,6])*sin(y)^2)^(3/2))*y
  L <- (as.numeric(Elipsoide[x,2])/sqrt(1 - as.numeric(Elipsoide[x,6])*sin(y)^2)*cos(y))*y
  values <- data.frame(r, S, L)
  names(values) <- c("r", "S", "L")
  return(values)
}

#' @name Geodesic to Cartesian
#'
#' @description To convert from Geodesic to Cartesian.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param b ELLIPSOIDAL HEIGHT (h).
#' @param c Radian Latitude.
#' @param d Radian longitude.
#'
#' @return value
#' @export
#'
#' @examples
#' # Lat
#' g <- -33
#' m <- 38
#' s <- 30.123456
#'
#' Value in radians
#' rad_lat <- radians(g, m, s)
#' print(rad_lat)
#'
#' # Lon
#' g <- -71
#' m <- 18
#' s <- 44.86475
#'
#' Value in radians
#' rad_lon <- radians(g,m,s)
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- cartesian(4,h, rad_lat, rad_lon)
#' print(value)
cartesian <- function(a,b,c,d){
  valueX <- (as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(c)^2)+b)*cos(c)*cos(d)
  valueY <- (as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(c)^2)+b)*cos(c)*sin(d)
  valueZ <- ((as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(c)^2))*(1 - as.numeric(Elipsoide[a,6]))+b)*sin(c)
  values <- data.frame(valueX, valueY, valueZ)
  names(values) <- c("X", "Y", "Z")
  return(values)
}

#' @name Cartesian to Geodesic
#'
#' @description To convert from Cartesian to Geodesic.
#'
#' @param a Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' @param x Cartesian x value.
#' @param y Cartesian y value.
#' @param z Cartesian z value.
#'
#' @return value
#' @export
#'
#' @examples
#' # Cartesian data
#' x <- 1711591.78090565
#' y <- -5060304.1659587
#' z <- -3473256.69328603
#'
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- Lat_lon_height(4,x,y,z)
#' print(value)
Lat_lon_height <- function(a,x,y,z){
  d <- sqrt(x^2+y^2)
  lon <- atan(y/x)
  lat <- atan((z+as.numeric(Elipsoide[a,5])*as.numeric(Elipsoide[a,7])*sin(atan((as.numeric(Elipsoide[a,2])*z)/(as.numeric(Elipsoide[a,5])*sqrt(x^2+y^2))))^3)/((sqrt(x^2+y^2))-as.numeric(Elipsoide[a,2])*as.numeric(Elipsoide[a,6])*cos(atan((as.numeric(Elipsoide[a,2])*z)/(as.numeric(Elipsoide[a,5])*sqrt(x^2+y^2))))^3))
  N <- as.numeric(Elipsoide[a,2])/sqrt(1 - as.numeric(Elipsoide[a,6])*sin(lat)^2)
  H <- (d/cos(lat))-N
  values <- data.frame(as.numeric(lat), as.numeric(lon), as.numeric(H))
  names(values) <- c("lat", "lon", "H")
  return(values)
}

#' @name Geodetic distance
#'
#' @description Reduction of the horizontal distance to the Ellipsoid.
#'
#' @param x Ellipsoidal height (h).
#' @param y Horizontal distance.
#'
#' @return value
#' @export
#'
#' @examples
#' # Test data
#' h <- 2500
#' Dhz <- 728.5
#'
#' value <- Geodis(h,Dhz)
#' print(value)
Geodis <- function(x,y){
  A <- (63780000+x)/63780000
  B <- y/((63780000+x)/63780000)
  values <- data.frame(as.numeric(A), as.numeric(B))
  names(values) <- c("Kh(h)", "GEODESIC DISTANCE")
  return(values)
}

#' @name Elliptical arch
#'
#' @description Rope reduction to elliptical arch.
#'
#' @param x Rope
#'
#' @return value
#' @export
#'
#' @examples
#' # Test data
#' ROPE <- 50000
#'
#' value <- ARCH(ROPE)
#' print(value)
ARCH <- function(x){
  value1 <- (x^3)/(24*63780000*63780000)
  value2 <- value1*1000000
  values <- data.frame(as.numeric(value1), as.numeric(value2))
  names(values) <- c("ARCO (S)", "PPM")
  return(values)
}

#' @name Scale factor
#'
#' @description Scale factor calculation.
#'
#' @param x East coordinate.
#' @param y Geodesic distance.
#'
#' @return value
#' @export
#'
#' @examples
#' # Test data
#' EAST <- 224200
#'
#' # Use the Geodesic distance from the function "Geodis"
#' arch_data <- Geodis(h,Dhz)
#'
#' value <- SCALE_FACTOR(EAST, arch_data[2])
#' print(value)
SCALE_FACTOR <- function(x, y){
  valueX <- 500000-x
  K_UTM <- 0.9996*(1+(valueX^2/(2*6378000^2)))
  D_UTM <- y*K_UTM
  DIF_DS <- D_UTM-y
  PPM <- (DIF_DS/D_UTM)*1000000
  values <- data.frame(as.numeric(valueX), as.numeric(K_UTM), as.numeric(D_UTM),
                       as.numeric(DIF_DS), as.numeric(PPM))
  names(values) <- c("X", "K UTM","D UTM", "DIF D-S", "PPM")
  return(values)
}

#' @name Geodetic coodinates to TM
#'
#' @description Geodesic coordinate transformation to TM
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
  N <- as.numeric(Elipsoide[a,2])/sqrt(1-as.numeric(Elipsoide[a,6])*sin(b*pi/180)^2)
  DELTA_LAMBA <- (c-d)*3600
  a1 <- as.numeric(Elipsoide[a,14])*b
  b1 <- as.numeric(Elipsoide[a,15])*sin(2*(b*pi/180))
  c1 <- as.numeric(Elipsoide[a,16])*sin(4*(b*pi/180))
  d1 <- as.numeric(Elipsoide[a,17])*sin(6*(b*pi/180))
  e1 <- as.numeric(Elipsoide[a,18])*sin(8*(b*pi/180))
  f1 <- as.numeric(Elipsoide[a,19])*sin(10*(b*pi/180))
  Be <- a1-b1+c1-d1+e1-f1
  t <- tan(b*pi/180)
  n <- sqrt(as.numeric(Elipsoide[a,7]))*cos(b*pi/180)
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

