                                                                                                                                                                                                                      #                                                                                                                                                                                       dddddddd                         
#BBBBBBBBBBBBBBBBB                                                           222222222222222    RRRRRRRRRRRRRRRRR      SSSSSSSSSSSSSSS      tttt                                        d::::::d  iiii                   
#B::::::::::::::::B                                                         2:::::::::::::::22  R::::::::::::::::R   SS:::::::::::::::S  ttt:::t                                        d::::::d i::::i                  
#B::::::BBBBBB:::::B                                                        2::::::222222:::::2 R::::::RRRRRR:::::R S:::::SSSSSS::::::S  t:::::t                                        d::::::d  iiii                   
#BB:::::B     B:::::B                                                       2222222     2:::::2 RR:::::R     R:::::RS:::::S     SSSSSSS  t:::::t                                        d:::::d                          
#  B::::B     B:::::B   ooooooooooo   rrrrr   rrrrrrrrr   nnnn  nnnnnnnn                2:::::2   R::::R     R:::::RS:::::S        ttttttt:::::ttttttt    uuuuuu    uuuuuu      ddddddddd:::::d iiiiiii    ooooooooooo   
#  B::::B     B:::::B oo:::::::::::oo r::::rrr:::::::::r  n:::nn::::::::nn              2:::::2   R::::R     R:::::RS:::::S        t:::::::::::::::::t    u::::u    u::::u    dd::::::::::::::d i:::::i  oo:::::::::::oo 
#  B::::BBBBBB:::::B o:::::::::::::::or:::::::::::::::::r n::::::::::::::nn          2222::::2    R::::RRRRRR:::::R  S::::SSSS     t:::::::::::::::::t    u::::u    u::::u   d::::::::::::::::d  i::::i o:::::::::::::::o
#  B:::::::::::::BB  o:::::ooooo:::::orr::::::rrrrr::::::rnn:::::::::::::::n    22222::::::22     R:::::::::::::RR    SS::::::SSSSStttttt:::::::tttttt    u::::u    u::::u  d:::::::ddddd:::::d  i::::i o:::::ooooo:::::o
#  B::::BBBBBB:::::B o::::o     o::::o r:::::r     r:::::r  n:::::nnnn:::::n  22::::::::222       R::::RRRRRR:::::R     SSS::::::::SS    t:::::t          u::::u    u::::u  d::::::d    d:::::d  i::::i o::::o     o::::o
#  B::::B     B:::::Bo::::o     o::::o r:::::r     rrrrrrr  n::::n    n::::n 2:::::22222          R::::R     R:::::R       SSSSSS::::S   t:::::t          u::::u    u::::u  d:::::d     d:::::d  i::::i o::::o     o::::o
#  B::::B     B:::::Bo::::o     o::::o r:::::r              n::::n    n::::n2:::::2               R::::R     R:::::R            S:::::S  t:::::t          u::::u    u::::u  d:::::d     d:::::d  i::::i o::::o     o::::o
#  B::::B     B:::::Bo::::o     o::::o r:::::r              n::::n    n::::n2:::::2               R::::R     R:::::R            S:::::S  t:::::t    ttttttu:::::uuuu:::::u  d:::::d     d:::::d  i::::i o::::o     o::::o
#BB:::::BBBBBB::::::Bo:::::ooooo:::::o r:::::r              n::::n    n::::n2:::::2       222222RR:::::R     R:::::RSSSSSSS     S:::::S  t::::::tttt:::::tu:::::::::::::::uud::::::ddddd::::::ddi::::::io:::::ooooo:::::o
#B:::::::::::::::::B o:::::::::::::::o r:::::r              n::::n    n::::n2::::::2222222:::::2R::::::R     R:::::RS::::::SSSSSS:::::S  tt::::::::::::::t u:::::::::::::::u d:::::::::::::::::di::::::io:::::::::::::::o
#B::::::::::::::::B   oo:::::::::::oo  r:::::r              n::::n    n::::n2::::::::::::::::::2R::::::R     R:::::RS:::::::::::::::SS     tt:::::::::::tt  uu::::::::uu:::u  d:::::::::ddd::::di::::::i oo:::::::::::oo 
#BBBBBBBBBBBBBBBBB      ooooooooooo    rrrrrrr              nnnnnn    nnnnnn22222222222222222222RRRRRRRR     RRRRRRR SSSSSSSSSSSSSSS         ttttttttttt      uuuuuuuu  uuuu   ddddddddd   dddddiiiiiiii   ooooooooooo   
#                                                                                                                                                                                                                        
#                                                                                                               Ismael Hernández Clemente - ismael.hernandez@live.u-tad.com | ismherna@student.42madrid.com - 06/11/2024                                                                                                                           
                                                                                                                                                                                                                        
## =setwd=, =getwd=, =dir=
## En =setwd= hay que especificar el directorio que contiene el repositorio.

getwd()
old <- setwd("~/github/intro")
dir()

dir(pattern='.R')

dir('data')

## Lectura de datos con =read.table= o =read.csv=

## - Función Genérica

dats <- read.table('data/aranjuez.csv', sep=',', header=TRUE)

head(dats)



## - Función específica

aranjuez <- read.csv('data/aranjuez.csv')

head(aranjuez)

class(aranjuez)

## Inspeccionamos el resultado

names(aranjuez)

head(aranjuez)

tail(aranjuez)

## Inspeccionamos el resultado

summary(aranjuez)

## Valores ausentes
## - =NA= está definido como =logical=

class(NA)



## - Operar con =NA= siempre produce un =NA=

1 + NA



## - Esto es un "problema" al usar funciones

mean(aranjuez$Radiation)

mean(aranjuez$Radiation, na.rm =  TRUE)

## Valores ausentes

## Las funciones =is.na= y =anyNA= los identifican 

anyNA(aranjuez)

which(is.na(aranjuez$Radiation))

sum(is.na(aranjuez$Radiation))

## Fechas


names(aranjuez)[1] <- "Date"

aranjuez$Date <- as.Date(aranjuez$Date)

class(aranjuez$Date)

summary(aranjuez$Date)

## Fechas
## - Podemos extraer información de un objeto =Date= con la función =format=[fn:1]:

aranjuez$month <- as.numeric(
    format(aranjuez$Date, '%m'))

aranjuez$year <- as.numeric(
    format(aranjuez$Date, '%Y'))

aranjuez$day <- as.numeric(
    format(aranjuez$Date, '%j'))

summary(aranjuez[, c("Date", "month", "year", "day")])

## Indexado con =[]=
## - Filas

aranjuez[1:5,]


## - Filas y Columnas

aranjuez[10:14, 1:5]

## Indexado con =[]=
## - Condición basada en los datos

idx <- with(aranjuez, Radiation > 20 & TempAvg < 10) 

head(aranjuez[idx, ])

## =subset=

subset(aranjuez,
       subset = (Radiation > 20 & TempAvg < 10),
       select = c(Radiation, TempAvg,
           TempMax, TempMin))

## =aggregate=

aranjuez$rainy <- aranjuez$Rain > 0

aggregate(Radiation ~ rainy, data = aranjuez,
          FUN = mean)

## Variable categórica con =cut=

aranjuez$tempClass <- cut(aranjuez$TempAvg, 5)

aggregate(Radiation ~ tempClass, data = aranjuez,
          FUN = mean)

aggregate(Radiation ~ tempClass + rainy,
          data = aranjuez, FUN = mean)

## Agregamos varias variables


aggregate(cbind(Radiation, TempAvg) ~ tempClass,
          data = aranjuez, FUN = mean)

aggregate(cbind(Radiation, TempAvg) ~ tempClass + rainy,
          data = aranjuez, FUN = mean)

## Con =merge=
## - Primero construimos un =data.frame= de ejemplo

USStates <- as.data.frame(state.x77)
USStates$Name <- rownames(USStates)
rownames(USStates) <- NULL


## - Lo partimos en estados "fríos" y estados "grandes"

coldStates <- USStates[USStates$Frost>150,
                       c('Name', 'Frost')]
largeStates <- USStates[USStates$Area>1e5,
                        c('Name', 'Area')]

## Con =merge=
## - Unimos los dos conjuntos (estados "fríos" y "grandes")

merge(coldStates, largeStates)

## =merge= usa =match=
## - Estados grandes que también son fríos

idxLarge <- match(largeStates$Name,
                  coldStates$Name,
                  nomatch=0)
idxLarge

coldStates[idxLarge,]

## =merge= usa =match=
## - Estados frios que también son grandes

idxCold <- match(coldStates$Name,
                 largeStates$Name,
                 nomatch=0)
idxCold

largeStates[idxCold,]

## Forma simple con =stack= 

aranjuezWide <- aranjuez[, c('Date', 'Radiation',
                             'TempAvg', 'TempMax',
                             'WindAvg', 'WindMax')]


## - Pasamos de formato =wide= a =long=

aranjuezLong <- stack(aranjuezWide)

head(aranjuezLong)

summary(aranjuezLong)

## Más flexible con =reshape2=
## - =reshape2= es un paquete que puede facilitar la transformación de =data.frame= y matrices.


library(reshape2)

## =melt= para cambiar de /wide/ a /long/

aranjuezLong2 <- melt(aranjuezWide, id.vars = 'Date',
                      variable.name = 'Variable',
                      value.name = 'Value')

head(aranjuezLong2)

## Agregamos a partir de un formato =long=


aggregate(Value ~ Variable, data = aranjuezLong2,
          FUN = mean)

## =dcast= para cambiar de /long/ a /wide/

aranjuezWide2 <- dcast(aranjuezLong2,
                       Variable ~ Date)
head(aranjuezWide2[, 1:10])
