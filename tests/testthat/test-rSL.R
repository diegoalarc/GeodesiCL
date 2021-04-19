test_that("To calculate the value of r, S and L works", {
  # Point name
  Pto <- "St1"

  # Latitude
  g <- -33
  m <- 38
  s <- 30.123456

  rad_lat <- radians(g, m, s)
  print(rad_lat)

  # Ellipsoidal height and Horizontal distance as data.frame
  pto_lat <- data.frame(Pto, rad_lat)

  # To know the ellipsoids and the order open the Ellipsoids in the package
  # and look for it number
  Ellip <- Ellipsoids
  #View(Ellip)

  # We choose the number 47 which is WGS84
  value <- rSL(47, pto_lat, digits = 4)
  expect_equal(rSL(47, pto_lat, digits = 4), value)
})
