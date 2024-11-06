# Proyecto Born2Rstudio

Este proyecto contiene un script en R (`DATOS.R`) que realiza varias operaciones de manipulación y análisis de datos. A continuación se describen las principales funcionalidades del script.

## Contenido del Script

### Configuración del Directorio de Trabajo

El script comienza configurando el directorio de trabajo y listando los archivos disponibles en el mismo.

```r
getwd()
old <- setwd("~/github/intro")
dir()
dir(pattern='.R')
dir('data')
```

### Lectura de Datos

Se leen los datos desde un archivo CSV utilizando `read.table` y `read.csv`.

```r
dats <- read.table('data/aranjuez.csv', sep=',', header=TRUE)
aranjuez <- read.csv('data/aranjuez.csv')
```

### Inspección de Datos

Se inspeccionan los datos utilizando funciones como `head`, `tail`, `summary`, y `names`.

```r
head(aranjuez)
summary(aranjuez)
```

### Manejo de Valores Ausentes

Se identifican y manejan los valores ausentes (`NA`) en los datos.

```r
anyNA(aranjuez)
which(is.na(aranjuez$Radiation))
mean(aranjuez$Radiation, na.rm = TRUE)
```

### Manipulación de Fechas

Se manipulan las fechas y se extrae información relevante como el mes, año y día.

```r
aranjuez$Date <- as.Date(aranjuez$Date)
aranjuez$month <- as.numeric(format(aranjuez$Date, '%m'))
```

### Indexado y Subconjuntos

Se realizan operaciones de indexado y se crean subconjuntos de datos basados en condiciones específicas.

```r
idx <- with(aranjuez, Radiation > 20 & TempAvg < 10)
subset(aranjuez, subset = (Radiation > 20 & TempAvg < 10))
```

### Agregación de Datos

Se agregan datos utilizando funciones como `aggregate`.

```r
aggregate(Radiation ~ rainy, data = aranjuez, FUN = mean)
```

### Combinación de Datos

Se combinan diferentes conjuntos de datos utilizando `merge`.

```r
merge(coldStates, largeStates)
```

### Transformación de Datos

Se transforman los datos entre formatos "wide" y "long" utilizando `reshape2`.

```r
library(reshape2)
aranjuezLong2 <- melt(aranjuezWide, id.vars = 'Date')
```

## Requisitos

- R
- Paquete `reshape2`

## Ejecución

Para ejecutar el script, asegúrese de tener R instalado y ejecute el siguiente comando en su terminal:

```sh
Rscript DATOS.R
```

## Autor

Ismael Hernández Clemente - ismael.hernandez@live.u-tad.com | ismherna@student.42madrid.com
