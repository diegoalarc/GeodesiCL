#' @import utils
utils::globalVariables(c("Ellipsoids", "Sin_1"))

#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

#' @importFrom sp SpatialPoints
#' @export
sp::SpatialPoints

#' @importFrom sp spTransform
#' @export
sp::spTransform

#' @importFrom sp proj4string
#' @export
sp::proj4string

#' @importFrom sp coordinates
#' @export
sp::coordinates

#' @importFrom sp CRS
#' @export
sp::CRS

#' @importFrom dplyr mutate
#' @export
dplyr::mutate

#' @importFrom dplyr n_distinct
#' @export
dplyr::n_distinct

#' @importFrom mapview mapview
#' @export
mapview::mapview

#' @importFrom leafpop popupTable
#' @export
leafpop::popupTable

#' @importFrom leaflet leaflet
#' @export
leaflet::leaflet

#' @importFrom leaflet addTiles
#' @export
leaflet::addTiles

#' @importFrom leaflet addMarkers
#' @export
leaflet::addMarkers

#' @importFrom htmltools HTML
#' @export
htmltools::HTML

#' @importFrom leaflet addProviderTiles
#' @export
leaflet::addProviderTiles

#' @importFrom tibble as_tibble
#' @export
tibble::as_tibble

#' @importFrom profvis profvis
#' @export
profvis::profvis

#' @importFrom readr read_csv
#' @export
readr::read_csv

#' @importFrom methods show
#' @export
methods::show

#' @importFrom rgdal projInfo
#' @export
rgdal::projInfo

#' @importFrom utils write.csv
#' @export
utils::write.csv
