# README

## Introduction

This project contains an R script (`INTRO.R`) that demonstrates various data manipulation and visualization techniques in R. The script covers topics such as reading data, data transformation, basic operations with vectors and matrices, and creating plots.

## File Structure

- `INTRO.R`: The main R script containing all the code examples and explanations.

## Usage

To run the script, you need to have R installed on your system. You can execute the script by sourcing it in an R session:

```r
source("INTRO.R")
```

### Data Transformation

It includes examples of data transformation, such as converting units:

```r
datos$Radiation2 <- datos$Radiation / 3.6
```

### Data Visualization

The script uses the `lattice` package to create plots:

```r
library(lattice)
xyplot(Radiation ~ TempAvg, data = datos, type = c("p", "r"), pch = 21, col = 'black', fill = 'gray')
```

### Basic Operations

Examples of basic operations with vectors and matrices are provided:

```r
x <- 1:5
x + 1
x^2
```

### Functions and Packages

The script demonstrates how to define functions and use packages:

```r
eleva <- function(x, p = 2) {
    x ^ p
}
eleva(1:10)
```

## Dependencies

The script requires the following R packages:
- `lattice`

You can install the required packages using:

```r
install.packages("lattice")
```

## Author

Ismael Hernández Clemente - ismael.hernandez@live.u-tad.com | ismherna@student.42madrid.com

## License

This project is licensed under the MIT License.