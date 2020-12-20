#' Reduction of the horizontal distance to the Ellipsoid.
#'
#' With this function it is possible to perform a reduction of the horizontal distance to the Ellipsoid.
#'
#' @param Data_fm Point name, Ellipsoidal height and Horizontal distance as dataframe.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return data.frame with the data in the following order: "Pt", "Kh(h)", "GEODESIC DISTANCE".
#' @export
#'
#' @examples
#' # Point name
#' Pto <- "St1"
#'
#' # Ellipsoidal height
#' h <- 2500
#'
#' # Horizontal distance
#' Dhz <- 728.5
#'
#' # Ellipsoidal height and Horizontal distance as data.frame
#' Ellips_Horzdist_df <- data.frame(Pto, h, Dhz)
#'
#' value <- geodis(Ellips_Horzdist_df, digits = 4)
#' print(value)
geodis <- function(Data_fm, digits = 4){
  x <- as.numeric(Data_fm[,2])
  y <- as.numeric(Data_fm[,3])
  A <- as.numeric((63780000+x)/63780000)
  B <- as.numeric(y/((63780000+x)/63780000))
  values <- tibble::as_tibble(as.data.frame(cbind(Data_fm[,1], round(A, digits), round(B, digits))))
  names(values) <- c("Pt", "Kh(h)", "GEODESIC DISTANCE")
  return(values)
}
