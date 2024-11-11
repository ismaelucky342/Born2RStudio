# README

## Overview

This project contains an R script named `ESTADISTICA.R` that performs various statistical analyses on the `swiss` dataset. The script includes calculations of summary statistics, visualizations, and different statistical tests.

## Files

- `ESTADISTICA.R`: The main R script containing all the statistical analyses.

## Usage

To run the script, you need to have R installed on your system. You can execute the script using an R console or any R IDE like RStudio.

```bash
Rscript ESTADISTICA.R
```

## Statistical Analyses

The script performs the following analyses:

1. **Summary Statistics**:
    - Summary of the `swiss` dataset.
    - Mean, standard deviation, median, MAD, and IQR of the `Fertility` variable.

2. **Distributions**:
    - Normal distribution.
    - Uniform distribution.
    - Weibull distribution.

3. **Random Sampling**:
    - Sampling with and without replacement.

4. **Statistical Tests**:
    - One-sample t-test and Wilcoxon test.
    - Paired t-test and Wilcoxon test.

5. **Linear Models**:
    - Linear regression models for `Fertility` against `Education`, `Catholic`, and `Agriculture`.
    - Model comparison using ANOVA.
    - Model selection using stepwise regression.

## Dependencies

The script requires the following R packages:
- `lattice`

You can install the required package using the following command:

```r
install.packages("lattice")
