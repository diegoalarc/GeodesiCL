test_that("To calculate 1-e^2*sen(lat)^2 works", {
   # Lat
   g <- -33
   m <- 38
   s <- 30.123456

   Ellip <- Ellipsoids
   View(Ellip)

   rad_lat <- radians(g, m, s)
   print(rad_lat)

   value <- E3(5, rad_lat, digits = 4)
   expect_equal(E3(5, rad_lat, digits = 4), value)
})
