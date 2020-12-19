test_that("To calculate 1-e^2 works", {
   # Ellipsoids are: 1 = 'PSAD56', 2 = 'SAD69', 3 = 'WGS84', 4 = 'GRS80',
   # 5 = 'GRS67', 6 = 'Airy 1830', 7 = 'Bessel 1841', 8 = 'Clarke 1880',
   # 9 = 'Clarke 1866', 10 = 'International 1924', 11 = 'Krasovsky 1940'
   value <- E2(4, digits = 4)
   expect_equal(E2(4, digits = 4), value)
})
