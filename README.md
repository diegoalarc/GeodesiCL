# GeodesiCL: A little journey into Geometric Geodesy.
###### Attention: Still in beta test

## To begin with
This package was created to introduce topographical and related engineers in the area of [Topography](https://en.wikipedia.org/wiki/Topography) and [Geodesy](https://en.wikipedia.org/wiki/Geodesy) as a basic introduction to Geometric Geodesy applying the necessary basic formulas.

This was a project created between [Diego Alarc�n](https://www.linkedin.com/in/diegoalarc%C3%B3nd%C3%ADaz/) and [Karla Riquelme](https://www.linkedin.com/in/karlariquelmecarrillo/) seeing the need to introduce the new generation of professionals in the learning of software language and in turn present free software.

##

### Installation
#### Install system dependencies
Please make sure that the [GDAL](https://www.gdal.org/) libraries are installed on your system.

 * Windows: use the [OSGeo4W installer](https://trac.osgeo.org/osgeo4w/) 
 * Ubuntu: `sudo apt install gdal-bin libgdal-dev ` 
 * MacOS: ask Siri

We currently have two ways to install this package, as it is not yet finalized for posting to [CRAN Project](https://cran.r-project.org/).

## First option

To use this package you should install [R](https://www.r-project.org/) & [RStudio](https://rstudio.com/), and simply copy and paste the following command into the [RStudio](https://rstudio.com/) console:


### Install the animove R package itself
```r
install.package("devtools")
install_github("diegoalarc/GeodesiCL")
```
!["Example Image"](https://github.com/diegoalarc/GeodesiCL/blob/main/image/r1.png "Example Image")

## Second option

Or if you already have experience using [R](https://www.r-project.org/) & [RStudio](https://rstudio.com/), and also have installed devtools you could just copy the following command:

```r
devtools::install_github("diegoalarc/GeodesiCL")
```
!["Example Image 2"](https://github.com/diegoalarc/GeodesiCL/blob/main/image/r2.png "Example Image 2")

##

We do hope you enjoy the package and give us your feedback in order to make this package better, easy and accurate as possible.
***
### Interesting fact
As entertaining fact, the name of the package is because geodesy is written geodesia in Spanish and CL represents the acronym of my country Chile but strangely you can see an A writing GeodesiA in Spanish (lol).
***
### *GNU General Public License v3.0 - Copyright (C)*

This script was made for testing purposes and can be used and modified in the future by those who deem it convenient.
