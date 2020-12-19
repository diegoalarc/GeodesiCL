test_that("To convert from Cartesian coordinate to Geographic coordinate works", {
   # Point name
   Pto <- "St1"

   # Cartesian data
   X <- 1711591.78090565
   Y <- -5060304.1659587
   Z <- -3473256.69328603

   # Pto, X, Y and Z as data.frame
   XYZ_df <- as.data.frame(cbind(Pto, X, Y, Z))

   # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
   # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
   # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
   value <- geodesic(4, XYZ_df, digits = 4)
   expect_equal(geodesic(4, XYZ_df, digits = 4), value)
})
