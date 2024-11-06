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
## Conjunto de datos: swiss


data(swiss)

summary(swiss)

library(lattice)
splom(swiss, pscale=0, type=c('p', 'smooth'),
      groups=swiss$Catholic > 50, xlab='')

## Resumen de  información

summary(swiss)

## Media

mean(swiss$Fertility)

colMeans(swiss)

## Desviación Estándar


sd(swiss$Fertility)

sapply(swiss, sd)

## Otras


median(swiss$Fertility)

mad(swiss$Fertility)

IQR(swiss$Fertility)

## Distribución Normal

rnorm(10, mean = 1, sd = .4)

hist(rnorm(1e6, mean = 1, sd = .4))

## Distribución Normal

x <- seq( -5, 5, by =.01)
plot(x, dnorm(x), type = 'l')

## Distribución Uniforme


runif(10, min=-3, max=3)

hist(runif(1e6, min = -3, max = 3))

## Distribución de Weibull

rweibull(n=10, shape = 3, scale = 2)

hist(rweibull(1e6, shape = 3, scale = 2))

## Muestreo aleatorio


x <- seq(1, 100, length = 10)
x



## - Sin reemplazo

sample(x)

sample(x, 5)



## - Con reemplazo

sample(x, 5, replace = TRUE)

## Para muestra única

## - t de Student

t.test(swiss$Fertility, mu=70)



## - Wilcoxon (no paramétrico)

wilcox.test(swiss$Fertility, mu=70)

## Para muestras pareadas

Religion <- ifelse(swiss$Catholic > 50,
                   'Catholic', 'Protestant')



## - t de Student

t.test(Fertility ~ Religion, data=swiss)

## Para muestras pareadas
## - Wilcoxon

wilcox.test(Fertility ~ Religion, data=swiss)

## Fertilidad y educación

lmFertEdu <- lm(Fertility ~ Education,
              data = swiss)
summary(lmFertEdu)

## Fertilidad y educación

coef(lmFertEdu)

fitted.values(lmFertEdu)

## Fertilidad y educación

residuals(lmFertEdu)

## Fertilidad y educación

plot(lmFertEdu, which = 1)

## Fertilidad, educación y religión

lmFertEduCat <- lm(Fertility ~ Education + Catholic,
                   data = swiss)
summary(lmFertEduCat)

## Lo mismo con =update=

lmFertEduCat <- update(lmFertEdu, . ~ . + Catholic,
                       data = swiss)
summary(lmFertEduCat)

## Fertilidad, educación, religión y agricultura

lmFertEduCatAgr <- lm(Fertility ~ Education + Catholic + Agriculture,
                      data = swiss)
summary(lmFertEduCatAgr)

## Lo mismo con =update=

lmFertEduCatAgr <- update(lmFertEduCat,
                          . ~ . + Agriculture,
                          data = swiss)
summary(lmFertEduCatAgr)

## Lo mismo con =update=

lmFertEduCatAgr <- update(lmFertEdu,
                          . ~ . + Catholic + Agriculture,
                          data = swiss)
summary(lmFertEduCatAgr)

## Comparamos modelos con =anova=

anova(lmFertEdu, lmFertEduCat, lmFertEduCatAgr)

## Fertilidad contra todo

lmFert <- lm(Fertility ~ ., data=swiss)

summary(lmFert)

## Elegir un modelo con =anova=

anova(lmFert)

## Elegir un modelo con =step=

stepFert <- step(lmFert)

## Elegir un modelo

summary(stepFert)

## Elegir un modelo

stepFert$anova
