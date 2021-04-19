#' Rope reduction to elliptical arch.
#'
#' With this function it is possible to perform a reduction from
#' chord to elliptical bow.
#'
#' @param x Rope
#' @param digits Number of digits are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' \donttest{
#' # Test data
#' ROPE <- 50000
#'
#' value <- arch(ROPE, digits = 4)
#' print(value)
#' }
arch <- function(x, digits = 4){
  value1 <- as.numeric((x^3)/(24*63780000*63780000))
  value2 <- as.numeric(value1*1000000)
  values <- data.frame(round(value1,digits), round(value2, digits))
  names(values) <- c("ARCO (S)", "PPM")
  return(values)
}
