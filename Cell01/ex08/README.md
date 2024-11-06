# README

## Introduction

This project contains R scripts for processing and visualizing spatial and temporal data using various R packages. The main script, `RASTER.R`, demonstrates how to handle NetCDF files, perform spatial operations, and create visualizations.

## Prerequisites

Ensure you have the following R packages installed:

```r
install.packages(c("sp", "ncdf", "raster", "zoo", "lattice", "latticeExtra", "rasterVis"))
```

## Usage

1. **Set Working Directory**: Update the working directory to the location of your repository.
    ```r
    setwd('~/github/intro/')
    ```

2. **Load Packages**: Load the necessary R packages.
    ```r
    library("sp")
    library("ncdf")
    library("raster")
    library("zoo")
    library("lattice")
    library("latticeExtra")
    library("rasterVis")
    ```

3. **Read CMSAF Files**: Unzip and read the NetCDF files.
    ```r
    old <- setwd('data')
    unzip("SISmm2008_CMSAF.zip")
    listFich <- dir(pattern="\\.nc")
    stackSIS <- stack(listFich)
    stackSIS <- stackSIS * 24
    setwd(old)
    ```

4. **Add Temporal Information**: Add temporal information to the data stack.
    ```r
    idx <- seq(as.Date("2008-01-15"), as.Date("2008-12-15"), "month")
    SISmm <- setZ(stackSIS, idx)
    ```

5. **Set Projection and Layer Names**: Define the projection and layer names.
    ```r
    proj <- CRS("+proj=longlat +ellps=WGS84")
    projection(SISmm) <- proj
    names(SISmm) <- month.abb
    ```

6. **Visualize Data**: Create various visualizations.
    ```r
    levelplot(SISmm)
    densityplot(SISmm)
    hovmoller(SISmm, dirXY=y, panel=panel.2dsmoother, n=1000)
    hovmoller(SISmm, dirXY=x, panel=panel.2dsmoother, n=1000)
    ```

7. **Calculate Annual Values**: Compute annual values per cell.
    ```r
    SISy <- sum(SISmm * c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)) / 1000
    names(SISy) <- 'G0'
    ```

8. **Extract Information**: Extract data for specific points or grids.
    ```r
    myPoint <- cbind(-3.6, 40.1)
    extract(SISmm, myPoint)
    ```
