test_that("To convert separated data in Degrees Minutes and Seconds to Radians
          works", {
  # Lat
  g <- -33
  m <- 38
  s <- 30.123456
  value <- radians(g, m, s, digits = 4)
  expect_equal(radians(g, m, s, digits = 4), value)
})
