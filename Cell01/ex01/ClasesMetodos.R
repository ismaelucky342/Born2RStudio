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
                                                                                                                                                                                                                        
## Clases
## Los objetos básicos en =R= tienen una clase implícita definida en =S3=. Es accesible con =class=.

  x <- rnorm(10)
  class(x)


## Pero no tienen atributo...

attr(x, 'class')


## ...ni se consideran formalmente objetos

is.object(x)

## Clases
## Se puede redefinir la clase de un objecto =S3= con =class=

  class(x) <- 'myNumeric'
  class(x)


## Ahora sí es un objeto... 

is.object(x)


## y su atributo está definido

attr(x, 'class')


## Sin embargo, su modo de almacenamiento (/clase intrínseca/) no cambia:

  mode(x)

## Definición de Clases 

  task1 <- list(what='Write an email',
                when=as.Date('2013-01-01'),
                priority='Low')
  class(task1) <- 'Task'
  task1

  task2 <- list(what='Find and fix bugs',
                when=as.Date('2013-03-15'),
                priority='High')
  class(task2) <- 'Task'

## Definición de Clases

  myToDo <- list(task1, task2)
  class(myToDo) <- c('ToDo3')
  myToDo

## Problemas de la sencillez de =S3=


  notToDo <- list(task1, 2019)
  class(notToDo) <- c('ToDo3')
  notToDo

## Métodos con =S3=

## Son *sencillos* de usar e implementar pero *poco robustos*.

## Se definen a partir de un método genérico...

summary



## ...añadiendo a la función el nombre de la clase con un punto como separador. 

summary.data.frame

## Métodos con =S3=	 
## Con =methods= podemos averiguar los métodos que hay definidos para una función particular:

methods('summary')

## Métodos con =S3=
## Si no hay un método definido para la clase del objeto, =UseMethod= ejecuta la función por defecto:

summary.default

## Ejemplo de definición de método genérico
## En primer lugar, definimos la función con =UseMethod=:

  myFun <- function(x, ...)UseMethod('myFun')


## ... y la función por defecto.

  myFun.default <- function(x, ...){
    cat('Funcion genérica\n')
    print(x)
    }

## Ejemplo de definición de método genérico
## Dado que aún no hay métodos definidos, esta función ejecutará la función por defecto.

methods('myFun')

x <- rnorm(10)
myFun(x)

myFun(task1)

## Ejemplo de definición de método específico

myFun.Task <- function(x, number,...)
{
    if (!missing(number))
        cat('Task no.', number,':\n')
    cat('What: ', x$what,
        '- When:', as.character(x$when),
        '- Priority:', x$priority,
        '\n')
}

methods(myFun)

methods(class='Task')

## Método de =Task=


myFun(task1)

myFun(task2)

myFun(myToDo)

myFun(myToDo)

## Definición de una nueva clase


setClass('bird',
         slots = c(
             name = 'character',
             lat = 'numeric',
             lon = 'numeric',
             alt = 'numeric',
             speed = 'numeric',
             time = 'POSIXct')
         )

## Funciones para obtener información de una clase

getClass('bird')

getSlots('bird')

slotNames('bird')

## Creación de un objeto con la clase definida
## Una vez que la clase ha sido definida con =setClass=, se puede crear un objeto nuevo con =new=. Es habitual definir funciones que construyen y modifican objetos para evitar el uso directo de =new=:

readBird <- function(name, path)
{
    csvFile <- file.path(path, paste0(name, ".csv"))

    vals <- read.csv(csvFile)
    
    new('bird',
        name = name,
        lat = vals$latitude,
        lon = vals$longitude,
        alt = vals$altitude,
        speed = vals$speed_2d,
        time = as.POSIXct(vals$date_time)
        )
}

## Creación de objetos con la clase definida

eric <- readBird("eric", "data")
nico <- readBird("nico", "data")
sanne <- readBird("sanne", "data")

## Acceso a los slots
## A diferencia de =$= en listas y =data.frame=, para extraer información de los /slots/ hay que emplear =@= (pero no es recomendable):

eric@name

summary(eric@speed)

## Clases =S4= con slots tipo lista

setClass("flock",
         slots = c(
             name = "character",
             members = "list")
         )

notAFlock <- new("flock",
                 name = "flock0",
                 members = list(eric,
                                3,
                                "hello"))
sapply(notAFlock@members, class)

## Función de validación

valida <- function (object) {
    if (any(sapply(object@members,
                   function(x) !is(x, "bird")))) 
        stop("only bird objects are accepted.")
    return(TRUE)
}

setClass("flock",
         slots = c(
             name = "character",
             members = "list"),
         validity = valida
         )

## Ejemplo de objeto =S4= con slot tipo =list=

newFlock <- function(name, ...){
    birds <- list(...)
    new("flock",
        name = name,
        members = birds)
}

notAFlock <- newFlock("flock0",
                    eric, 2, "hello")

myFlock <- newFlock("flock1",
                    eric, nico, sanne)

## Métodos en =S4=: =setMethod=
## - Normalmente se definen con =setMethod= suministrando:
##   - la clase de los objetos para /esta/ definición del
##     método (=signature=)
##   - la función a ejecutar (=definition=).

setMethod('show',
          signature = "bird",
          definition = function(object)
          {
              cat("Name: ", object@name, "\n")
              cat("Latitude: ", summary(object@lat), "\n")
              cat("Longitude: ", summary(object@lon), "\n")
              cat("Speed: ", summary(object@speed), "\n")
          })

eric

## Métodos en =S4=: =setMethod=

setMethod('show',
          signature = "flock",
          definition = function(object)
          {
              cat("Flock Name: ", object@name, "\n")
              N <- length(object@members)
              lapply(seq_len(N), function(i)
              {
                  cat("Bird #", i, "\n")
                  print(object@members[[i]])
              })
          })

myFlock

## Métodos en =S4=: =setGeneric=
## - Es necesario que exista un método genérico ya definido.

isGeneric("as.data.frame")


## - Si no existe, se define con =setGeneric= (y quizás =standardGeneric=).

setGeneric("as.data.frame")


## - La función =definition= debe respetar los argumentos de la función genérica y en el mismo orden.

getGeneric("as.data.frame")

## Métodos en =S4=: ejemplo con =as.data.frame=

setMethod("as.data.frame",
          signature = "bird",
          definition = function(x, ...)
          {
              data.frame(
                  name = x@name,
                  lat = x@lat,
                  lon = x@lon,
                  alt = x@alt,
                  speed = x@speed,
                  time = x@time)
          })

ericDF <- as.data.frame(eric)

flockDF <- as.data.frame(myFlock)

## Métodos en =S4=: ejemplo con =xyplot=

library(lattice)

setGeneric("xyplot")

setMethod('xyplot',
          signature = "bird",
          definition = function(x, data = NULL, ...)
          {
              df <- as.data.frame(x)
              xyplot(lat ~ lon, data = df, ...)
          })

xyplot(eric)

xyplot(eric, mode = "lontime")

xyplot(myFlock)

## Clases =S3= con clases y métodos =S4=
## Para usar objetos de clase =S3= en =signatures= de métodos =S4= o
## como contenido de =slots= de una clase =S4= hay que registrarlos con
## =setOldClass=:

setOldClass('lm')

getClass('lm')

## Ejemplo con =lm= y =xyplot=
## Definimos un método genérico para =xyplot=

library(lattice)
setGeneric('xyplot')


## Definimos un método para la clase =lm= usando =xyplot=.

setMethod('xyplot',
          signature = c(x = 'lm',
                        data = 'missing'),
          definition = function(x, data,
                                ...)
          {
              fitted <- fitted(x)
              residuals <- residuals(x)
              xyplot(residuals ~ fitted,...)
          })

## Ejemplo con =lm= y =xyplot=
## Recuperamos la regresión que empleamos en el apartado de Estadística:

lmFertEdu <- lm(Fertility ~ Education, data = swiss)
summary(lmFertEdu)

## Ejemplo con =lm= y =xyplot=


xyplot(lmFertEdu, col='red', pch = 19,
       type = c('p', 'g'))
