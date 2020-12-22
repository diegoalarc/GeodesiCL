#' Read data for test
#'
#' @format A data frame with 19 columns:
#' \describe{
#'  \item{Pt}{Contains the names of each point}
#'  \item{East}{East UTM coordinate in a \code{tibble}}
#'  \item{North}{North UTM coordinate in a \code{tibble}}
#'}
#' @return a \code{tibble}
#' @export
#'
#' @examples
#' # Test data
#' test_data
#' print(test_data)
#'
#' # Test data option 2
#' date <- test_data
#' print(date)
test_data <- utils::read.csv(system.file("extdata", "test.csv", package = "GeodesiCL"), sep = ",")
