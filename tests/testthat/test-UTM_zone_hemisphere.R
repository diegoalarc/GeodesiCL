test_that("To find the zone hemisphere from Longitude and Latitude the
          UTM zone works", {
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

   value <- UTM_zone_hemisphere(sexa_long, sexa_lat)
   expect_equal(UTM_zone_hemisphere(sexa_long, sexa_lat), value)
})
