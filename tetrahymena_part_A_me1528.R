
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

#Step 1: load the script the tsv file
mydata <- read_tsv("tetrahymena.tsv")
View(mydata)

#Step 2: removing the rows which has diameter <= 19.2
mydata <- mydata[!mydata$diameter <= 19.2,]

#Step 3: computing the mean for culture and glucose grouping, respectively
meanCulture <- mydata[,2:4] %>% group_by(culture) %>% summarise_all(funs(mean(., na.rm=TRUE)))

meanGlucose <- mydata %>% group_by(glucose) %>% summarise_all(funs(mean(., na.rm=TRUE)))

#Step 4: adding new columns for log_concentration and log_diameter, respectively
mydata$log_conc <- log(mydata$conc)

mydata$log_diameter <- log(mydata$diameter)

#Step 5 and 6: doing scatter plot using ggplot and geom_smooth to display the smooth line
ggplot(mydata, aes(x=log_conc, y=log_diameter,shape=glucose,color=glucose)) + geom_point() + geom_smooth(method=lm, se=FALSE, fullrange=TRUE)

#save the plot into PDF
ggsave("tetrahymena_part_A_From_R_me1528.pdf")
