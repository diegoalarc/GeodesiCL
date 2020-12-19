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

   # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
   # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
   # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
   value <- TO_TM(4, longlat_df, CM, SC_FACTOR_Ko, FE, FN, digits = 4)
   expect_equal(TO_TM(4, longlat_df, CM, SC_FACTOR_Ko, FE, FN, digits = 4), value)
})
