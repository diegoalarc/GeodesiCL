#' Scalfactor
#'
#' Scale factor calculation.
#'
#' @param EAST_Geodist_df East coordinate and Geodesic distance as data.frame.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return value
#' @export
#'
#' @examples
#' # Point name
#' Pto <- "St1"
#'
#' # East coordinate.
#' EAST <- 224200
#'
#' # Ellipsoidal height
#' h <- 2500
#'
#' # Horizontal distance
#' Dhz <- 728.5
#'
#' # Ellipsoidal height and Horizontal distance as data.frame
#' Ellips_Horzdist_df <- as.data.frame(cbind(Pto, h, Dhz))
#'
#' geodis <- geodis(Ellips_Horzdist_df, digits = 4)
#'
#' # East coordinate and Geodesic distance as data.frame
#' EAST_Geodist_df <- as.data.frame(cbind(Pto, EAST, geodis[,3]))
#'
#' value <- scalfactor(EAST_Geodist_df, digits = 4)
#' print(value)
scalfactor <- function(EAST_Geodist_df, digits = 4){
  x <- as.numeric(EAST_Geodist_df[,2])
  y <- as.numeric(EAST_Geodist_df[,3])
  valueX <- as.numeric(500000-x)
  K_UTM <- as.numeric(0.9996*(1+(valueX^2/(2*6378000^2))))
  D_UTM <- as.numeric(y*K_UTM)
  DIF_DS <- as.numeric(D_UTM-y)
  PPM <- as.numeric((DIF_DS/D_UTM)*1000000)
  values <- data.frame(EAST_Geodist_df[,1],round(valueX, digits), round(K_UTM, digits), round(D_UTM, digits),
                       round(DIF_DS, digits), round(PPM, digits))
  names(values) <- c("Pt", "X", "K UTM","D UTM", "DIF D-S", "PPM")
  return(values)
}
