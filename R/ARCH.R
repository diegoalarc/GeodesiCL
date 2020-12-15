#' ARCH
#'
#' Rope reduction to elliptical arch.
#'
#' @param x Rope
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' # Test data
#' ROPE <- 50000
#'
#' value <- ARCH(ROPE, digits = 4)
#' print(value)
ARCH <- function(x, digits = 4){
  value1 <- as.numeric((x^3)/(24*63780000*63780000))
  value2 <- as.numeric(value1*1000000)
  values <- data.frame(round(value1,digits), round(value2, digits))
  names(values) <- c("ARCO (S)", "PPM")
  return(values)
}
