## ---- echo=FALSE--------------------------------------------------------------
knitr::opts_chunk$set(error = TRUE)

## -----------------------------------------------------------------------------
library(GeodesiCL)
library(profvis)

## -----------------------------------------------------------------------------
# Point name
Pto <- "St1"

# Longitude
g <- -71
m <- 18
s <- 44.86475

# Value in sexagesimal
sexa_long <- sexagesimal(g,m,s)

# Latitude
g <- -33
m <- 38
s <- 30.123456

# Value in sexagesimal
sexa_lat <- sexagesimal(g, m, s)
print(sexa_lat)

# ELLIPSOIDAL HEIGHT (h)
h <- 31.885

# Longitude and Latitude as data.frame
longlat_df <- data.frame(Pto, sexa_long, sexa_lat, h)

profile <- profvis(for (i in seq_len(100)) (cartesian(4, longlat_df, digits = 4)))
profile

## -----------------------------------------------------------------------------
# Point name
Pto <- "St1"

# Value for East
East <- 650012.58

# Value for North
North <- 5590735.41

# East and North as data.frame
utm_df <- data.frame(Pto,East,North)

# Zone
zone <- 18

# Hemisphere could be "north" or "south"
hemisphere <- "south"
 
profile <- profvis(for (i in seq_len(100)) (UTMtoLongLat(utm_df, zone, hemisphere = "south", digits = 4)))
profile

## -----------------------------------------------------------------------------
# Point name
Pto <- "St1"

# Longitude
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

# Longitude and Latitude as data.frame
longlat_df <- data.frame(Pto,sexa_long,sexa_lat)

profile <- profvis(for (i in seq_len(100)) (LongLatToUTM(longlat_df, units = 'm', digits = 4)))
profile

