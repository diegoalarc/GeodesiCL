test_that("To convert separated data in Degrees Minutes and Seconds to
          Decimal degrees works", {
  # Latitude
  g <- -33
  m <- 38
  s <- 30.123456
  value <- sexagesimal(g, m, s, digits = 4)
  expect_equal(sexagesimal(g, m, s, digits = 4), value)
})
