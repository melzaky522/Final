#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("ggplot2")
#load dplyr package
library("dplyr")

#load the ggplot2 package
library(ggplot2)

#load the tidyverse packa
library("tidyverse")
library("readr")

#load the script the tsv file
mydata <- read_tsv("tetrahymena.tsv")
View(mydata)
mydata <- mydata[!mydata$diameter <= 19.2,]

#computing mean for culture level
test1 <- mydata[,2:4] %>% group_by(culture) %>% summarise_all(funs(mean(., na.rm=TRUE)))

#computing mean for glucose level
test2 <- mydata %>% group_by(glucose) %>% summarise_all(funs(mean(., na.rm=TRUE)))

#adding new column for log_concentration 
mydata$log_conc <- log(mydata$conc)

#adding new column for log_diameter
mydata$log_diameter <- log(mydata$diameter)

#doing scatter plot 
ggplot(mydata, aes(x=log_conc, y=log_diameter,shape=glucose,color=glucose)) + geom_point() + geom_smooth(method=lm, se=FALSE, fullrange=TRUE)
ggsave("etrahymena_part_A_NETID.pdf")
