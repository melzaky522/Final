
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

#load the script the tsv file : Step 1
mydata <- read_tsv("tetrahymena.tsv")
View(mydata)

#removing the rows which has diameter <= 19.2 : Step 2
mydata <- mydata[!mydata$diameter <= 19.2,]

#computing mean for culture grouping : step 3 
test1 <- mydata[,2:4] %>% group_by(culture) %>% summarise_all(funs(mean(., na.rm=TRUE)))

#computing mean for glucose grouping : Step 3
test2 <- mydata %>% group_by(glucose) %>% summarise_all(funs(mean(., na.rm=TRUE)))

#adding new column for log_concentration  : Step 4
mydata$log_conc <- log(mydata$conc)

#adding new column for log_diameter : Step 4
mydata$log_diameter <- log(mydata$diameter)

#doing scatter plot  : Step 5 and Step 6
ggplot(mydata, aes(x=log_conc, y=log_diameter,shape=glucose,color=glucose)) + geom_point() + geom_smooth(method=lm, se=FALSE, fullrange=TRUE)

#save the plot into PDF
ggsave("tetrahymena_part_A_From_R_me1528.pdf")
