test_that("Rope reduction to elliptical arch",
          {
            ROPE <- 50000
            value <- arch(ROPE, digits = 4)
            expect_equal(arch(ROPE, digits = 4), value)
            }
          )
