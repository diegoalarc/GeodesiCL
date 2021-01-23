test_that("To find the zone hemisphere from Longitude and Latitude the UTM zone works", {
    # Load test data from the package
    csv <- system.file("extdata", "test.csv", package = "GeodesiCL")
    data_test <- read_data(csv)

    # Zone
    zone <- 19

    # Hemisphere could be "north" or "south"
    hemisphere <- "south"

    value <- UTMtoLongLat(data_test, zone, hemisphere = "south", crs = 4326, digits = 4)
    expect_equal(UTMtoLongLat(data_test, zone, hemisphere = "south", crs = 4326, digits = 4)[[1]], value[[1]])
})
