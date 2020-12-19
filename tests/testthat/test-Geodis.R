test_that("Reduction of the horizontal distance to the Ellipsoid works", {
   # Point name
   Pto <- "St1"

   # Ellipsoidal height
   h <- 2500

   # Horizontal distance
   Dhz <- 728.5

   # Ellipsoidal height and Horizontal distance as data.frame
   Ellips_Horzdist_df <- data.frame(Pto, h, Dhz)

   value <- geodis(Ellips_Horzdist_df, digits = 4)
   expect_equal(geodis(Ellips_Horzdist_df, digits = 4), value)
})
