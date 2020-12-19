test_that("To calculate the value of N works", {
   # Latitude
   g <- -33
   m <- 38
   s <- 30.123456

   rad_lat <- radians(g, m, s)
   print(rad_lat)

   # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
   # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
   # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
   value <- N(4, rad_lat, digits = 4)
   expect_equal(N(4, rad_lat, digits = 4), value)
})
