[![HitCount](http://hits.dwyl.com/diegoalarc/GeodesiCL.svg)][HitCount-url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![R-CMD-check](https://github.com/diegoalarc/GeodesiCL/workflows/R-CMD-check/badge.svg)][R-CMD-check-url]
[![Codecov test coverage](https://codecov.io/gh/diegoalarc/GeodesiCL/branch/main/graph/badge.svg)][Codecov-test-coverage-url]
[![Project Status: Active ??? The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)][Project-Status-url]
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/diego.alarcondiaz@gmail.com)

# <a href="https://github.com/diegoalarc/GeodesiCL">`GeodesiCL`</a>: A little journey into Geometric Geodesy.
###### Attention: We are ready to go!!
***
## To begin with
This package was created to introduce topographical and related engineers in the area of [Topography](https://en.wikipedia.org/wiki/Topography) and [Geodesy](https://en.wikipedia.org/wiki/Geodesy) as a basic introduction to __Geometric Geodesy__ applying the necessary basic formulas.

This was a project created between [Diego Alarc�n](https://www.linkedin.com/in/diegoalarc%C3%B3nd%C3%ADaz/) and [Karla Riquelme](https://www.linkedin.com/in/karlariquelmecarrillo/) seeing the need to introduce the new generation of professionals in the learning of software language and in turn present free software.

The <a href="https://en.wikipedia.org/wiki/Ellipsoid">`Ellipsoids`</a> within the package are as follows:
| `Ellipsoids`       | `a`         | `1/f`         |
| :----------------: | :---------: | :-----------: |
| PSAD56             | 6378388     | 297           |
| SAD69              | 6378160     | 298.25        |
| WGS84              | 6378137     | 298.257223563 |
| GRS80              | 6378137     | 298.257222101 |
| GRS67              | 6378160     | 298.25        |
| Airy 1830          | 6377563.396 | 299.3249646   |
| Bessel 1841        | 6377397.155 | 299.1528434   |
| Clarke 1866        | 6378206.4   | 294.9786982   |
| Clarke 1880        | 6378249.145 | 293.465       |
| International 1924 | 6378388     | 297           |
| Krasovsky 1940     | 6378245     | 298.2997381   |

***
## Functions

Here you can see the <a href="https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/function">`functions`</a> contained in the package. Is it possible to read its description by copying to the console `? + function` or if you want to see an example just using `example(function)` like the following:

###### Check out each example, since most functions work with data.frame that has a specific order for its data.

`arch`: Rope reduction to elliptical arch.
```r
?arch

example(arch)
```
`cartesian`: To convert from Geographic coordinate to Cartesian coordinate.
```r
?cartesian

example(cartesian)
```
`E2`: To calculate 1-e^2.
```r
?E2

example(E2)
```
`E3`: To calculate 1-e^2*sen(lat)^2.
```r
?E3

example(E3)
```
`geodesic`: To convert from Cartesian coordinate to Geographic coordinate.
```r
?geodesic

example(geodesic)
```
`geodis`: Reduction of the horizontal distance to the Ellipsoid.
```r
?geodis

example(geodis)
```
`LongLatToUTM`: To convert from Geographic coordinate to UTM coordinate.
```r
?LongLatToUTM

example(LongLatToUTM)
```
`M`: To calculate the value of M.
```r
?M

example(M)
```
`N`: To calculate the value of N.
```r
?N

example(N)
```

`PlotLongLat`: To plot using Geographic coordinate.
```r
?PlotLongLat

example(PlotLongLat)
```

`radians`: To convert separated data in Degrees Minutes and Seconds to Radians.
```r
?radians

example(radians)
```
`rSL`: To calculate the value of r, S and L.
```r
?rSL

example(rSL)
```
`scalfactor`: To calculate scale factor calculation.
```r
?scalfactor

example(scalfactor)
```
`sexagesimal`: To convert separated data in Degrees Minutes and Seconds to Decimal degrees.
```r
?sexagesimal

example(sexagesimal)
```
`TO_TM`: To convert from Geographic coordinate to TM.
```r
?TO_TM

example(TO_TM)
```
`UTMtoLongLat`: To convert from UTM to Geographic coordinate.
```r
?UTMtoLongLat

example(UTMtoLongLat)
```
`UTM_zone_hemisphere`: To find the zone hemisphere from Longitude and Latitude the UTM zone.
```r
?UTM_zone_hemisphere

example(UTM_zone_hemisphere)
```

***

## Installation
#### Install system dependencies
Please make sure that the [GDAL](https://www.gdal.org/) libraries are installed on your system:

 * Windows: use the [OSGeo4W installer](https://trac.osgeo.org/osgeo4w/).
 * Ubuntu: `sudo apt install gdal-bin libgdal-dev`
 * MacOS: `brew install gdal --HEAD` or `brew install gdal`

For more information on GDAL installation [Click here!](https://medium.com/@egiron/how-to-install-gdal-and-qgis-on-macos-catalina-ca690dca4f91)

We currently have two ways to install this package, as it is not yet finalized for posting to [CRAN Project](https://cran.r-project.org/).

### First option

After we already have the `system dependencies`, to use this package you should install [R](https://www.r-project.org/) & [RStudio](https://rstudio.com/). Next, you need to install the <a href="https://www.r-project.org/nosvn/pandoc/devtools.html">`devtools`</a> package in order to start with the installation of the `GeodesiCL` package, then just copy and paste the following command into the [RStudio](https://rstudio.com/) console:

```r
install.packages("devtools")
devtools::install_github("diegoalarc/GeodesiCL")
```
!["Example Image"](https://github.com/diegoalarc/GeodesiCL/blob/main/man/image/r1.png "Example Image")

### Second option

If you already have experience using [R](https://www.r-project.org/) & [RStudio](https://rstudio.com/), and also have installed <a href="https://www.r-project.org/nosvn/pandoc/devtools.html">`devtools`</a>  you could just copy the following command:

```r
devtools::install_github("diegoalarc/GeodesiCL")
```
!["Example Image 2"](https://github.com/diegoalarc/GeodesiCL/blob/main/man/image/r2.png "Example Image 2")

***
### Interesting fact

As entertaining fact, the name of the package is because __geodesy__ is written __geodesia__ in Spanish and CL represents the acronym of my country __Chile__ but strangely you can see an A writing __GeodesiA__ in Spanish (lol).

***
### Contribution

We do hope you enjoy the package and give us your __feedback__ in order to make this package better, easy and accurate as possible! Open an issue to start a discussion:
 * <a href="https://github.com/diegoalarc/GeodesiCL/issues">`Issues press here!!!`</a>

***
### *GNU General Public License v3.0 - Copyright (C)*
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

This script was made for testing purposes and may be used and modified in the future by those who see fit.

***
#### Package stats

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/GeodisCL?color=green)](https://cran.r-project.org/package=GeodisCL)
![](https://cranlogs.r-pkg.org/badges/grand-total/GeodisCL?color=green)
![](https://cranlogs.r-pkg.org/badges/GeodisCL?color=green)
![](https://cranlogs.r-pkg.org/badges/last-week/GeodisCL?color=green)

[![Github All Releases](https://img.shields.io/github/downloads/diegoalarc/GeodesiCL/total.svg)]()

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[HitCount-url]: http://hits.dwyl.com/diegoalarc/GeodesiCL
[contributors-shield]: https://img.shields.io/github/contributors/diegoalarc/GeodesiCL
[contributors-url]: https://github.com/diegoalarc/GeodesiCL/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/diegoalarc/GeodesiCL
[forks-url]: https://github.com/diegoalarc/GeodesiCL/network/members
[stars-shield]: https://img.shields.io/github/stars/diegoalarc/GeodesiCL
[stars-url]: https://github.com/diegoalarc/GeodesiCL/stargazers
[issues-shield]:https://img.shields.io/github/issues/diegoalarc/GeodesiCL
[issues-url]: https://github.com/diegoalarc/GeodesiCL/issues
[license-shield]:https://img.shields.io/github/license/diegoalarc/GeodesiCL
[license-url]: https://github.com/diegoalarc/GeodesiCL/blob/master/LICENSE.txt
[R-CMD-check-url]:https://github.com/diegoalarc/GeodesiCL/actions
[Codecov-test-coverage-url]:https://codecov.io/gh/diegoalarc/GeodesiCL?branch=main
[Project-Status-url]:https://www.repostatus.org/#active
