# Bird Tracking Data Analysis

This project involves analyzing bird tracking data obtained from the [LifeWatch INBO](https://lifewatch.inbo.be/blog/files/bird_tracking.zip). The data includes tracking information for several birds, and this analysis focuses on three specific birds: Nico, Eric, and Sanne.

## Data Preparation

The data is read from a CSV file and converted into a suitable format for analysis. The dataset is then filtered to create separate datasets for each bird.

### Script: `birds.R`

```r
## Datos obtenidos de
## https://lifewatch.inbo.be/blog/files/bird_tracking.zip
birds <- read.csv("data/bird_tracking.csv")
birds$date_time <- as.POSIXct(birds$date_time)

nico <- subset(birds, bird_name == "Nico")
eric <- subset(birds, bird_name == "Eric")
sanne <- subset(birds, bird_name == "Sanne")

write.csv(eric, file = "data/eric.csv", row.names = FALSE)
write.csv(nico, file = "data/nico.csv", row.names = FALSE)
write.csv(sanne, file = "data/sanne.csv", row.names = FALSE)
```

## Files

- `data/bird_tracking.csv`: The original dataset containing tracking data for multiple birds.
- `data/eric.csv`: Filtered dataset for the bird named Eric.
- `data/nico.csv`: Filtered dataset for the bird named Nico.
- `data/sanne.csv`: Filtered dataset for the bird named Sanne.

## Usage

To run the script and generate the filtered datasets, execute the `birds.R` script in your R environment.

```sh
Rscript birds.R
```

This will create three new CSV files in the `data` directory, each containing the tracking data for one of the specified birds.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

Data provided by [LifeWatch INBO](https://lifewatch.inbo.be/).
