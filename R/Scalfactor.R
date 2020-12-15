#' Scalfactor
#'
#' Scale factor calculation.
#'
#' @param x East coordinate.
#' @param y Geodesic distance.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' # Test data
#' EAST <- 224200
#' h <- 2500
#' Dhz <- 728.5
#'
#' # Use the Geodesic distance from the function "Geodis"
#' arch_data <- geodis(h,Dhz)
#'
#' value <- scalfactor(EAST, arch_data[2], digits = 4)
#' print(value)
scalfactor <- function(x, y, digits = 4){
  valueX <- as.numeric(500000-x)
  K_UTM <- as.numeric(0.9996*(1+(valueX^2/(2*6378000^2))))
  D_UTM <- as.numeric(y*K_UTM)
  DIF_DS <- as.numeric(D_UTM-y)
  PPM <- as.numeric((DIF_DS/D_UTM)*1000000)
  values <- data.frame(round(valueX, digits), round(K_UTM, digits), round(D_UTM, digits),
                       round(DIF_DS, digits), round(PPM, digits))
  names(values) <- c("X", "K UTM","D UTM", "DIF D-S", "PPM")
  return(values)
}
