% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Radians.R
\name{radians}
\alias{radians}
\title{To convert separated data in Degrees Minutes and Seconds to Radians.}
\usage{
radians(x, y, z, digits = 4)
}
\arguments{
\item{x}{Value of Degree in Latitude or Longitude.}

\item{y}{Value of Minute in Latitude or Longitude.}

\item{z}{Value of Seconds in Latitude or Longitude.}

\item{digits}{Number of digits are \code{\link{round}ed} to. DEFAULT: 4}
}
\value{
value
}
\description{
With this function it is possible to convert separated data in
Degrees Minutes and Seconds to Radians.
}
\examples{
\donttest{
# Lat
g <- -33
m <- 38
s <- 30.123456
value <- radians(g, m, s, digits = 4)
print(value)
}
}
