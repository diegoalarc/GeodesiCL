test_that("To plot using Geographic coordinate works", {
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

   value <- PlotLongLat(longlat_df)
   expect_equal(PlotLongLat(longlat_df)[[1]], value[[1]])
})
