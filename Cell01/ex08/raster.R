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

## Primeros pasos en R
## - Configuramos el directorio de trabajo

  ## Entre las comillas hay que indicar el directorio en el que está el
  ## repositorio (será visible la carpeta data/)
  setwd('~/github/intro/')

## - Cargo los paquetes que usaremos

  ## Si no están instalados hay que usar install.packages('Nombre_del_Paquete')
  ## Clases y métodos para datos espaciales
  library("sp")
  library("ncdf")
  library("raster")
  ## Series temporales
  library("zoo")
  ## Gráficos
  library("lattice")
  library("latticeExtra")
  library("rasterVis")

## Leo los ficheros CMSAF

old <- setwd('data')
unzip("SISmm2008_CMSAF.zip")
listFich <- dir(pattern="\\.nc")
stackSIS <- stack(listFich)
## irradiancia (W/m2) a irradiacion Wh/m2
stackSIS <- stackSIS*24
setwd(old)

## Añado información temporal

  idx <- seq(as.Date("2008-01-15"),
             as.Date("2008-12-15"),
             "month")
  
  SISmm <- setZ(stackSIS, idx)

## Fijo la proyección de trabajo y nombres de capas

  proj <- CRS("+proj=longlat +ellps=WGS84")
  projection(SISmm) <- proj
  names(SISmm) <- month.abb

## Veamos la información  
## - Mapa clásico

  levelplot(SISmm)

## - Densidad de probabilidad por capa (mes)

  densityplot(SISmm)

## Más sobre visualización
## - Gráfico Hovmoller (tiempo-latitud)

  hovmoller(SISmm, dirXY=y,
            panel=panel.2dsmoother, n=1000)

## - Gráfico Hovmoller (tiempo-longitud)

  hovmoller(SISmm, dirXY=x,
            panel=panel.2dsmoother, n=1000)

## Calculamos el valor anual por celda
## - No del todo correcto (cada mes tiene un número diferente de días)

SISy <- mean(SISmm) * 365/1000

## - Mejorado

  SISy <-  sum(SISmm *
               c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31))/1000
  names(SISy) <- 'G0'

## Veamos la radiación anual
## - Relación con la longitud y la latitud

  xyplot(G0 ~ y, data=SISy)
  xyplot(G0 ~ x, data=SISy)

## - Distribución de valores

  histogram(SISy)

## Extraemos información de un punto

  myPoint <- cbind(-3.6, 40.1)
  extract(SISmm, myPoint)

## Extraemos información de varios puntos

  myLocs <- cbind(-8, 38:43)
  SISlocs <- extract(SISmm, myLocs)

## - Superponemos mapa global con la localización de los puntos

  levelplot(SISy) +
    layer(sp.points(myLocs,
                    pch=16, col='black')) 

## Extraemos información de una rejilla

  extent(SISmm)
  myGrid <- expand.grid(long=-10:4, lat=36:44)
  SISgrid <- extract(SISmm, myGrid)

## - Nuevamente superponemos mapa y rejilla

  levelplot(SISy) +
    layer(sp.points(myGrid,
                    pch=16, col='black')) 

## Estaciones MAGRAMA-SIAR
## - Localización de las [[https://raw.github.com/oscarperpinan/intro/master/data/SIAR.csv][estaciones SIAR]]

  SIAR <- read.csv("data/SIAR.csv")

## - Construimos un objeto espacial con la información y las coordenadas

  spSIAR <- SpatialPointsDataFrame(SIAR[, c(6, 7)],
                                   SIAR[, -c(6, 7)],
                                   proj4str=proj)
  head(spSIAR)

## - Mostramos el mapa de radiación anual con las estaciones SIAR

  levelplot(SISy, layers='Jun') +
    layer(sp.points(spSIAR,
                    pch=19, col='black', cex=0.6))

## Extraemos información de CMSAF

  CMSAF.SIAR <- extract(SISmm, spSIAR)
  CMSAF.SIAR <- zoo(t(CMSAF.SIAR), as.yearmon(idx))
  names(CMSAF.SIAR) <- spSIAR$Estacion
  summary(CMSAF.SIAR)

## Particularizamos para una estación
## - Primero extraemos información para la estación de Madrid

  madridSIAR <- subset(SIAR, Provincia == "Madrid")
  spMadrid <- SpatialPoints(
                madridSIAR[, c('lon', 'lat')],
                proj4str=proj)
  CMSAFMadrid <- extract(SISmm, spMadrid)
  CMSAFMadrid <- zoo(t(CMSAFMadrid), as.yearmon(idx))
  names(CMSAFMadrid) <- madridSIAR$Estacion

## - Mostramos la serie temporal correspondiente

  xyplot(CMSAFMadrid,
         superpose=TRUE,
         auto.key=list(space='right'))
