test_that("To convert from Cartesian coordinate to Geographic coordinate works",
          {
   # Point name
   Pto <- "St1"

   # Cartesian data
   X <- 1711591.78090565
   Y <- -5060304.1659587
   Z <- -3473256.69328603

   # Pto, X, Y and Z as data.frame
   XYZ_df <- as.data.frame(cbind(Pto, X, Y, Z))

   # To know the ellipsoids and the order open the Ellipsoids in the package
   # and look for it number
   Ellip <- Ellipsoids

   # We choose the number 5 which is GRS80
   value <- geodesic(5, XYZ_df, digits = 4)
   expect_equal(geodesic(5, XYZ_df, digits = 4), value)
})
