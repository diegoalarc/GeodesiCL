#' E2
#'
#' To calculate 1-e^2
#'
#' @param x Selection of Ellipsoid to work between 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#'
#' @return value
#' @export
#'
#' @examples
#' # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
#' # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
#' # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
#' value <- E2(4)
#' print(value)
E2 <- function(x){
#  Ellipsoids <- NULL
  value <- 1 - as.numeric(Ellipsoids[x,6])
  return(value)
}
