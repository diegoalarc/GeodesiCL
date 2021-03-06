% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/UTM_zone_hemisphere.R
\name{UTM_zone_hemisphere}
\alias{UTM_zone_hemisphere}
\title{To find the zone hemisphere from Longitude and Latitude the UTM zone.}
\usage{
UTM_zone_hemisphere(x, y)
}
\arguments{
\item{x}{Sexagesimal longitude.}

\item{y}{Sexagesimal latitude.}
}
\value{
value
}
\description{
With this function it is possible to find the zone hemisphere
from Geographic coordinate to obtain the UTM zone.
}
\examples{
\donttest{
#' # Longitude
g <- -71
m <- 18
s <- 44.86475

# Value in sexagesimal
sexa_long <- sexagesimal(g, m, s)

# Latitude
g1 <- -33
m1 <- 12
s1 <- 27.11457

# Value in sexagesimal
sexa_lat <- sexagesimal(g1, m1, s1)

value <- UTM_zone_hemisphere(sexa_long, sexa_lat)
print(value)
}
}
