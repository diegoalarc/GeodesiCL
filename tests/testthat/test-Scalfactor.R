test_that("multiplication works", {
   # Point name
   Pto <- "St1"

   # East coordinate.
   EAST <- 224200

   # Ellipsoidal height
   h <- 2500

   # Horizontal distance
   Dhz <- 728.5

   # Ellipsoidal height and Horizontal distance as data.frame
   Ellips_Horzdist_df <- as.data.frame(cbind(Pto, h, Dhz))

   geodis <- geodis(Ellips_Horzdist_df, digits = 4)

   # East coordinate and Geodesic distance as data.frame
   EAST_Geodist_df <- as.data.frame(cbind(Pto, EAST, geodis[,3]))

   value <- scalfactor(EAST_Geodist_df, digits = 4)
   expect_equal(scalfactor(EAST_Geodist_df, digits = 4), value)
})
