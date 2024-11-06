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
 



