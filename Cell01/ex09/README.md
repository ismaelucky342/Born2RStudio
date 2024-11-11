# README

## Overview

This repository contains R scripts and data for analyzing weather data from Aranjuez and Lanai-Hawaii. The analysis includes data visualization, transformation to time series, and aggregation of data by different time intervals.

## Files

- `zoo.R`: Main R script containing the data analysis and visualization code.
- `data/`: Directory containing the data files used in the analysis.

## Data

The data used in this analysis includes weather data from Aranjuez and Lanai-Hawaii. The data files are in CSV format and are read into R using various functions such as `read.table`, `read.csv`, and `read.zoo`.

## Usage

1. **Set Working Directory**: Set the working directory to the location of the repository.
    ```r
    setwd('~/github/intro/')
    ```

2. **Read Data**: Read the data files into R.
    ```r
    dats <- read.table('data/aranjuez.csv', sep=',', header=TRUE)
    aranjuez <- read.csv('data/aranjuez.csv')
    ```

3. **Visualize Data**: Use the `lattice` package to create various plots.
    ```r
    library(lattice)
    xyplot(Radiation ~ TempAvg, data=aranjuez)
    ```

4. **Transform to Time Series**: Convert the data to a time series object using the `zoo` package.
    ```r
    library(zoo)
    aranjuez <- zoo(aranjuez[, -1], as.POSIXct(aranjuez[,1], format='%Y-%m-%d'))
    ```

5. **Aggregate Data**: Aggregate the data by year, month, or other time intervals.
    ```r
    Year <- function(x) as.numeric(format(x, "%Y"))
    aranjuezY <- aggregate(aranjuez$G0, by=Year, FUN=mean, na.rm=TRUE)
    ```

## Advanced Visualization

Use the `RColorBrewer` package for advanced data visualization.
```r
library(RColorBrewer)
humidClass <- cut(aranjuez$HumidAvg, 4)
myPal <- brewer.pal(n=4, 'GnBu')
xyplot(Radiation ~ TempAvg + TempMax + TempMin, groups=humidClass, data=aranjuez, xlab='Temperature', layout=c(3, 1), scales=list(relation='free'), auto.key=list(space='right'), par.settings=custom.theme(pch=16, alpha=0.8, col=myPal))
```

## Data Cleaning

Perform data cleaning and unit conversion.
```r
aranjuezClean <- within(as.data.frame(aranjuez), {
    TempMin[TempMin > 40] <- NA
    HumidMax[HumidMax > 100] <- NA
    WindAvg[WindAvg > 10] <- NA
    WindMax[WindMax > 10] <- NA
})
aranjuez <- zoo(aranjuezClean, index(aranjuez))
```

## Example: Lanai-Hawaii

Read and analyze data from Lanai-Hawaii.
```r
URL <- "http://www.nrel.gov/midc/apps/plot.pl?site=LANAI&start=20090722&edy=19&emo=11&eyr=2010&zenloc=19&year=2010&month=11&day=1&endyear=2010&endmonth=11&endday=19&time=1&inst=3&inst=4&inst=5&inst=10&type=data&first=3&math=0&second=-1&value=0.0&global=-1&direct=-1&diffuse=-1&user=0&axis=1"
hawaii <- read.zoo(URL, col.names = c("date", "hour", "G0", "B", "D0", "Ta"), index = list(1, 2), FUN = function(d, h) as.POSIXct(paste(d, h), format = "%m/%d/%Y %H:%M", tz = "HST"), header=TRUE, sep=",")
```

## License

This project is licensed under the MIT License.

## Contact

For any questions or issues, please contact Ismael Hernández Clemente at ismael.hernandez@live.u-tad.com or ismherna@student.42madrid.com.