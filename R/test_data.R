#' Read data in csv.
#'
#' @param x the name of the file which the data are to be read from. this is a \code{data.frame} in format csv.
#' @param digits Number of digits the seconds are \code{\link{round}ed} to. DEFAULT: 4
#'
#' @return a \code{tibble}
#' @export
#'
#' @seealso Package 'tibble' as 'readr'
#'
#' @examples
#' # Test data
#' csv <- system.file("extdata", "test.csv", package = "GeodesiCL")
#' data_test <- read_data(csv)
read_data <- function(x, digits = 4){
  values <- readr::read_csv(x)
  values1 <- tibble::as_tibble(data.frame(Pt = unlist(values$Pt),
                                         East = as.character(unlist(round(values$East, digits))),
                                         North = as.character(unlist(round(values$North, digits)))))
  return(print(values1))
}
