# `GeodesiCL`: A little journey into Geometric Geodesy.
###### Attention: Still in beta test
***
## To begin with
This package was created to introduce topographical and related engineers in the area of [Topography](https://en.wikipedia.org/wiki/Topography) and [Geodesy](https://en.wikipedia.org/wiki/Geodesy) as a basic introduction to Geometric Geodesy applying the necessary basic formulas.

This was a project created between [Diego Alarcón](https://www.linkedin.com/in/diegoalarc%C3%B3nd%C3%ADaz/) and [Karla Riquelme](https://www.linkedin.com/in/karlariquelmecarrillo/) seeing the need to introduce the new generation of professionals in the learning of software language and in turn present free software.

The `Ellipsoids` within the package are as follows:
```r
| Ellipsoids         | a           | 1/f           |
| :----------------: | :---------: | :-----------: |
| PSAD56             | 6378388     | 297           |
| SAD69              | 6378160     | 298.25        |
| WGS84              | 6378137     | 298.257223563 |
| GRS80              | 6378137     | 298.257222101 |
| GRS67              | 6378160     | 298.25        |
| Airy 1830          | 6377563.396 | 299.3249646   |
| Bessel 1841        | 6377397.155 | 299.1528434   |
| Clarke 1880        | 6378249.145 | 293.465       |
| Clarke 1866        | 6378206.4   | 294.9786982   |
| International 1924 | 6378388     | 297           |
| Krasovsky 1940     | 6378245     | 298.2997381   |
```

The `formulas` contained in the `package` are as follows:
```r
`ARCH`: Rope reduction to elliptical arch.
`cartesian`: To convert from Geodesic to Cartesian.
`E2`: To calculate 1-e^2.
`E3`: To calculate 1-e^2*sen(lat)^2.
`geodesic`: To convert from Cartesian to Geodesic.
`geodis`: Reduction of the horizontal distance to the Ellipsoid.
`LongLatToUTM`: To convert from Longitude and Latitude to UTM.
`M`: To calculate the value of M.
`N`: To calculate the value of N.
`radians`: Convert separated data in Degrees Minutes and Seconds to Radians.
`rSL`: To calculate the value of r, S and L.
`scalfactor`: Scale factor calculation.
`sexagesimal`: Convert separated data in Degrees Minutes and Seconds to Decimal degrees.
`TO_TM`: Geodesic coordinate transformation to TM.
`UTMtoLongLat`: To convert from UTM to Longitude and Latitude.
`UTM_zone_hemisphere`: To find from Longitude and Latitude the UTM zone.
```

In each of the `formulas` it is possible to reproduce an `example` as follows:
```r
example(TO_TM)
```

***

## Installation
#### Install system dependencies
Please make sure that the [GDAL](https://www.gdal.org/) libraries are installed on your system:

 * Windows: use the [OSGeo4W installer](https://trac.osgeo.org/osgeo4w/).
 * Ubuntu: `sudo apt install gdal-bin libgdal-dev`
 * MacOS: ask Siri.

We currently have two ways to install this package, as it is not yet finalized for posting to [CRAN Project](https://cran.r-project.org/).

### First option

To use this package you should install [R](https://www.r-project.org/) & [RStudio](https://rstudio.com/). Next, you need to install the <a href="https://www.r-project.org/nosvn/pandoc/devtools.html">`devtools`</a> package in order to start with the installation of the `GeodesiCL` package. and simply copy and paste the following command into the [RStudio](https://rstudio.com/) console:

```r
install.package("devtools")
install_github("diegoalarc/GeodesiCL")
```
!["Example Image"](https://github.com/diegoalarc/GeodesiCL/blob/main/image/r1.png "Example Image")

### Second option

If you already have experience using [R](https://www.r-project.org/) & [RStudio](https://rstudio.com/), and also have installed <a href="https://www.r-project.org/nosvn/pandoc/devtools.html">`devtools`</a>  you could just copy the following command:

```r
devtools::install_github("diegoalarc/GeodesiCL")
```
!["Example Image 2"](https://github.com/diegoalarc/GeodesiCL/blob/main/image/r2.png "Example Image 2")

***
### Interesting fact

As entertaining fact, the name of the package is because geodesy is written geodesia in Spanish and CL represents the acronym of my country Chile but strangely you can see an A writing GeodesiA in Spanish (lol).

***
### Contribution

We do hope you enjoy the package and give us your feedback in order to make this package better, easy and accurate as possible.! Open an issue to start a discussion: 
 * <https://github.com/diegoalarc/GeodesiCL/issues> 

***
### *GNU General Public License v3.0 - Copyright (C)*

This script was made for testing purposes and may be used and modified in the future by those who see fit.
