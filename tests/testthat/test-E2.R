test_that("To calculate 1-e^2 works", {
   Ellip <- Ellipsoids
   View(Ellip)

   value <- E2(5, digits = 4)
   expect_equal(E2(5, digits = 4), value)
})
