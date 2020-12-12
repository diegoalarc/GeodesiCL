#' Geodis
#'
#' Reduction of the horizontal distance to the Ellipsoid.
#'
#' @param x Ellipsoidal height.
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
#' value <- geodis(h, Dhz)
#' print(value)
geodis <- function(x, y){
  A <- (63780000+x)/63780000
  B <- y/((63780000+x)/63780000)
  values <- data.frame(as.numeric(A), as.numeric(B))
  names(values) <- c("Kh(h)", "GEODESIC DISTANCE")
  return(values)
}
