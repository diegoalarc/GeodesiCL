#' ARCH
#'
#' Rope reduction to elliptical arch.
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
