% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Scalfactor.R
\name{scalfactor}
\alias{scalfactor}
\title{To calculate scale factor calculation.}
\usage{
scalfactor(EAST_Geodist_df, digits = 4)
}
\arguments{
\item{EAST_Geodist_df}{Point name, East coordinate and Geodesic distance as
data.frame.}

\item{digits}{Number of digits are \code{\link{round}ed} to. DEFAULT: 4}
}
\value{
data.frame with the data in the following order: "Pt", "X", "K UTM",
"D UTM", "DIF D-S", "PPM".
}
\description{
With this function it is possible to calculate the scale factor.
}
\examples{
\donttest{
# Point name
Pto <- "St1"

# East coordinate.
EAST <- 224200

# Ellipsoidal height
h <- 2500

# Horizontal distance
Dhz <- 728.5

# Ellipsoidal height and Horizontal distance as data.frame
Ellips_Horzdist_df <- as.data.frame(cbind(Pto, h, Dhz))

geodis <- geodis(Ellips_Horzdist_df, digits = 4)

# East coordinate and Geodesic distance as data.frame
EAST_Geodist_df <- as.data.frame(cbind(Pto, EAST, geodis[,3]))

value <- scalfactor(EAST_Geodist_df, digits = 4)
print(value)
}
}
