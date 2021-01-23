test_that("To calculate the value of N works", {
   # Latitude
   g <- -33
   m <- 38
   s <- 30.123456

   rad_lat <- radians(g, m, s)
   print(rad_lat)

   # To know the ellipsoids and the order open the Ellipsoids in the package and look for it number
   Ellip <- Ellipsoids
   #View(Ellip)

   # We choose the number 5 which is GRS80
   value <- N(5, rad_lat, digits = 4)
   expect_equal(N(5, rad_lat, digits = 4), value)
})
