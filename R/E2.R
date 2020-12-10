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
#' # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
#' value <- E2(4)
#' print(value)
E2 <- function(x){
#  Ellipsoids <- NULL
  value <- 1 - as.numeric(Ellipsoids[x,6])
  return(value)
}
