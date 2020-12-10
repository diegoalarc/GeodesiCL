#' Scalfactor
#'
#' Scale factor calculation.
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
#' h <- 2500
#' Dhz <- 728.5
#'
#' # Use the Geodesic distance from the function "Geodis"
#' arch_data <- geodis(h,Dhz)
#'
#' value <- scalfactor(EAST, arch_data[2])
#' print(value)
scalfactor <- function(x, y){
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
