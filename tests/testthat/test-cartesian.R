test_that("To convert from Geographic coordinate to Cartesian coordinate works", {
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

   # Ellipsoids are: 1 = 'PSAD-56', 2 = 'SAD-69',	3 = 'WGS-84',	4 ='GRS-80 (SIRGAS)'.
   value <- cartesian(4, longlat_df, digits = 4)

   expect_equal(cartesian(4, longlat_df, digits = 4), value)
})
