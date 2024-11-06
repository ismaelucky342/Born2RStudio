# README

## Overview

This project contains R scripts for generating various types of plots using the `lattice` and `ggplot2` libraries. The data used in these scripts is sourced from the `mtcars` dataset and a custom dataset named `aranjuez`.

## Files

- `GRAFICOS.R`: Contains R code for generating different types of plots.

## Dependencies

- R
- `lattice` library
- `ggplot2` library
- `RColorBrewer` library
- `GGally` library

## Usage

1. Load the required libraries:
    ```r
    library(lattice)
    library(ggplot2)
    library(RColorBrewer)
    library(GGally)
    ```

2. Load the datasets:
    ```r
    data(mtcars)
    aranjuez <- read.csv('data/aranjuez.csv')
    ```

3. Generate plots using the provided code snippets in `GRAFICOS.R`.

## Examples

### Scatter Plot with `lattice`
```r
xyplot(wt ~ mpg | am, data = mtcars, groups = cyl)
```

### Scatter Plot with `ggplot2`
```r
ggplot(mtcars, aes(mpg, wt)) +
    geom_point(aes(colour=factor(cyl))) +
    facet_grid(. ~ am)
```

### Summary of `aranjuez` Data
```r
summary(aranjuez)
```

### Scatter Plot with Linear Regression Line
```r
ggplot(aranjuez, aes(TempAvg, Radiation)) + 
    geom_point() +
    geom_smooth(method = "lm")
```

### Box Plot with `ggplot2`
```r
ggplot(aranjuez, aes(factor(month), Radiation)) + 
    geom_boxplot()
```

### Histogram with `ggplot2`
```r
ggplot(aranjuez, aes(Radiation)) + 
    geom_histogram() +
    facet_wrap(~factor(year))
```

## Author

Ismael Hernández Clemente - ismael.hernandez@live.u-tad.com | ismherna@student.42madrid.com

## Date

06/11/2024