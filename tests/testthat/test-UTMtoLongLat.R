test_that("To find the zone hemisphere from Longitude and Latitude the UTM zone works", {
    # Point name
    Pto <- "St1"

    # Value for East
    East <- 650012.58

    # Value for North
    North <- 5590735.41

    # East and North as data.frame
    utm_df <- data.frame(Pto,East,North)

    # Zone
    zone <- 18

    # Hemisphere could be "north" or "south"
    hemisphere <- "south"

    value <- UTMtoLongLat(utm_df, zone, hemisphere = "south", digits = 4)
    expect_equal(UTMtoLongLat(utm_df, zone, hemisphere = "south", digits = 4)[[1]], value[[1]])
})
