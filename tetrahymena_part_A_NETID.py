#!/usr/bin/python
import numpy as np
import pandas as pd
#import matplotlib.pyplot as plt
#import seaborn as sns

mydata = pd.read_csv("tetrahymena.tsv",delimiter='\t')
mydata = mydata[mydata.diameter > 19.2]

test1 = mydata.groupby(mydata.culture)
for name,group in test1:
    print(name,group)
test2 = mydata.groupby(mydata.glucose)
for name,group in test2:
    print(name,group)
#test1 <- mydata[,2:4] %>% group_by(culture) %>% summarise_all(funs(mean(., na.rm=TRUE)))
#test2 <- mydata[,1:3] %>% group_by(glucose) %>% summarise_all(funs(mean(., na.rm=TRUE)))
mydata = mydata.assign(log_conc = np.log(mydata.conc))
mydata = mydata.assign(log_diameter = np.log(mydata.diameter))

##sns.set(style="ticks")
##without line for seperation of data
##sns_plot = sns.lmplot("log_conc","log_diameter",data=mydata,hue='glucose',legend=False,markers=["o","^"],fit_reg=False,scatter_kws={"s":50})
#
##with line for seperation of data
#sns_plot = sns.lmplot("log_conc","log_diameter",data=mydata,hue='glucose',legend=False,markers=["o","^"],fit_reg=True,scatter_kws={"s":50})
#plt.legend(loc="upper right")
#
#sns_plot.savefig("etrahymena_part_A_NETID.pdf")
