#' Read data in csv.
#'
#' @param x the name of the file which the data are to be read from. this is a \code{data.frame} in format csv.
#'
#' @return a \code{tibble}
#' @export
#'
#' @seealso Package 'utils' in it 'read.table'
#'
#' @examples
#' # Test data
#' csv <- system.file("extdata", "test.csv", package = "GeodesiCL")
#' data_test <- read_data(csv)
read_data <- function(x){
  options(digits=16)
  values <- readr::read_csv(x)
  return(print(values))
}
