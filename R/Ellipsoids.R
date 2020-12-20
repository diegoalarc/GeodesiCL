#' Contains the values for conversion of the Ellipsoids PSAD-56, SAD-69, WGS-84, GRS-80 SIRGAS.
#'
#' @format A data frame with 19 columns:
#' \describe{
#'  \item{Ellipsoids}{Contains the names of each ellipsoid.}
#'  \item{a}{Semi major axis of each ellipsoid.}
#'  \item{1/f}{1/Flattening of each ellipsoid.}
#'  \item{f}{Flattening of each ellipsoid.}
#'  \item{b}{Semi minor axis of each ellipsoid.}
#'  \item{e^2}{1st eccentricity squared of each ellipsoid.}
#'  \item{e'^2}{2nd eccentricity squared of each ellipsoid.}
#'  \item{A}{A Constant.}
#'  \item{B}{B Constant.}
#'  \item{C}{C Constant.}
#'  \item{D}{D Constant.}
#'  \item{E}{E Constant.}
#'  \item{F}{F Constant.}
#'  \item{Alfa}{Alfa Constant.}
#'  \item{Beta}{Beta Constant.}
#'  \item{Gamma}{Gamma Constant.}
#'  \item{Delta}{Delta Constant.}
#'  \item{Epsilon}{Epsilon Constant.}
#'  \item{Zeta}{Zeta Constant.}
#' }
#' @examples
#' \dontrun{
#'  | Ellipsoids         | a           | 1/f           |
#'  | :----------------: | :---------: | :-----------: |
#'  | PSAD56             | 6378388     | 297           |
#'  | SAD69              | 6378160     | 298.25        |
#'  | WGS84              | 6378137     | 298.257223563 |
#'  | GRS80              | 6378137     | 298.257222101 |
#'  | GRS67              | 6378160     | 298.25        |
#'  | Airy 1830          | 6377563.396 | 299.3249646   |
#'  | Bessel 1841        | 6377397.155 | 299.1528434   |
#'  | Clarke 1866        | 6378206.4   | 294.9786982   |
#'  | Clarke 1880        | 6378249.145 | 293.465       |
#'  | International 1924 | 6378388     | 297           |
#'  | Krasovsky 1940     | 6378245     | 298.2997381   |
#' }
"Ellipsoids"
