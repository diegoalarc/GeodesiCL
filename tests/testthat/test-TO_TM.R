test_that("To convert from Geographic coordinate to TM works", {
   # Test data
   CM <- -69.00000
   SC_FACTOR_Ko <- 0.99960
   FE <- 500000.00000
   FN <- 10000000.00000

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
   longlat_df <- as.data.frame(cbind(Pto,sexa_long,sexa_lat))

   # ELLIPSOIDAL HEIGHT (h)
   h <- 31.885

   # To know the ellipsoids and the order open the Ellipsoids in the package and look for it number
   Ellip <- Ellipsoids
   #View(Ellip)

   # We choose the number 47 which is WGS84
   value <- TO_TM(a = 47, longlat_df, CM, SC_FACTOR_Ko, FE, FN, digits = 4)
   expect_equal(TO_TM(47, longlat_df, CM, SC_FACTOR_Ko, FE, FN, digits = 4), value)
})
