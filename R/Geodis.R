#' Geodis
#'
#' Reduction of the horizontal distance to the Ellipsoid.
#'
#' @param x Ellipsoidal height.
#' @param y Horizontal distance.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' # Test data
#' h <- 2500
#' Dhz <- 728.5
#'
#' value <- geodis(h, Dhz, digits = 4)
#' print(value)
geodis <- function(x, y, digits = 4){
  A <- as.numeric((63780000+x)/63780000)
  B <- as.numeric(y/((63780000+x)/63780000))
  values <- data.frame(round(A, digits), round(B, digits))
  names(values) <- c("Kh(h)", "GEODESIC DISTANCE")
  return(values)
}
