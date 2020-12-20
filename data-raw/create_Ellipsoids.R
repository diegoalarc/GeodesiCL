## code to prepare `Ellipsoids` dataset goes here
## To use the raw-data run the next line
## usethis::use_data_raw()
names_elip <- c('PSAD56', 'SAD69', 'WGS84', 'GRS80', 'GRS67', 'Airy 1830', 'Bessel 1841', 'Clarke 1866', 'Clarke 1880', 'International 1924', 'Krasovsky 1940')

a <-	c(6378388, 6378160, 6378137, 6378137, 6378160, 6377563.396, 6377397.155, 6378206.4, 6378249.145, 6378388, 6378245)

divF <- c(297, 298.25, 298.257223563, 298.257222101, 298.25, 299.3249646, 299.1528434, 294.9786982, 293.465, 297, 298.2997381)

Ellipsoids <- tibble::as_tibble(as.data.frame(cbind(names_elip,
                                  a,
                                  divF,
                                  1/divF,
                                  a-1/divF*a,
                                  1-((a-1/divF*a)^2/a^2),
                                  (a^2/(a-1/divF*a)^2)-1,
                                  1+3/4*(1-((a-1/divF*a)^2/a^2))+45/64*(1-((a-1/divF*a)^2/a^2))^2+175/256*(1-((a-1/divF*a)^2/a^2))^3+11025/16384*(1-((a-1/divF*a)^2/a^2))^4+43659/65536*(1-((a-1/divF*a)^2/a^2))^5,
                                  3/4*(1-((a-1/divF*a)^2/a^2))+15/16*(1-((a-1/divF*a)^2/a^2))^2+525/512*(1-((a-1/divF*a)^2/a^2))^3+2205/2048*(1-((a-1/divF*a)^2/a^2))^4+72765/65536*(1-((a-1/divF*a)^2/a^2))^5,
                                  15/64*(1-((a-1/divF*a)^2/a^2))^2+105/256*(1-((a-1/divF*a)^2/a^2))^3+2205/4096*(1-((a-1/divF*a)^2/a^2))^4+10395/16384*(1-((a-1/divF*a)^2/a^2))^5,
                                  35/512*(1-((a-1/divF*a)^2/a^2))^3+315/2048*(1-((a-1/divF*a)^2/a^2))^4+31185/131072*(1-((a-1/divF*a)^2/a^2))^5,
                                  315/16384*(1-((a-1/divF*a)^2/a^2))^4+3465/65536*(1-((a-1/divF*a)^2/a^2))^5,
                                  639/131072*(1-((a-1/divF*a)^2/a^2))^5,
                                  (1+3/4*(1-((a-1/divF*a)^2/a^2))+45/64*(1-((a-1/divF*a)^2/a^2))^2+175/256*(1-((a-1/divF*a)^2/a^2))^3+11025/16384*(1-((a-1/divF*a)^2/a^2))^4+43659/65536*(1-((a-1/divF*a)^2/a^2))^5)*a*(1-(1-((a-1/divF*a)^2/a^2)))/(180/pi),
                                  (3/4*(1-((a-1/divF*a)^2/a^2))+15/16*(1-((a-1/divF*a)^2/a^2))^2+525/512*(1-((a-1/divF*a)^2/a^2))^3+2205/2048*(1-((a-1/divF*a)^2/a^2))^4+72765/65536*(1-((a-1/divF*a)^2/a^2))^5)*a*(1-(1-((a-1/divF*a)^2/a^2)))/2,
                                  (15/64*(1-((a-1/divF*a)^2/a^2))^2+105/256*(1-((a-1/divF*a)^2/a^2))^3+2205/4096*(1-((a-1/divF*a)^2/a^2))^4+10395/16384*(1-((a-1/divF*a)^2/a^2))^5)*a*(1-(1-((a-1/divF*a)^2/a^2)))/4,
                                  (35/512*(1-((a-1/divF*a)^2/a^2))^3+315/2048*(1-((a-1/divF*a)^2/a^2))^4+31185/131072*(1-((a-1/divF*a)^2/a^2))^5)*a*(1-(1-((a-1/divF*a)^2/a^2)))/6,
                                  (315/16384*(1-((a-1/divF*a)^2/a^2))^4+3465/65536*(1-((a-1/divF*a)^2/a^2))^5)*a*(1-(1-((a-1/divF*a)^2/a^2)))/8,
                                  (639/131072*(1-((a-1/divF*a)^2/a^2))^5)*a*(1-(1-((a-1/divF*a)^2/a^2)))/10
)))
names(Ellipsoids) <- c("Ellipsoids", "a", "1/f", "f", "b", "e^2", "e'^2",
                      "A", "B", "C", "D", "E", "F",
                      "Alfa", "Beta", "Gamma", "Delta", "Epsilon", "Zeta")

usethis::use_data(Ellipsoids, compress = "xz", overwrite = TRUE)