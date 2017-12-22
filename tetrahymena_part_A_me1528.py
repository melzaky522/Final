#!/usr/bin/python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Step 1: reading the dataset 
mydata = pd.read_csv("tetrahymena.tsv",delimiter='\t')

#Step 2: Filtering out cells that have a diameter <= 19.2
mydata = mydata[mydata.diameter > 19.2]

#Step 3: Using mean concentration and diameter over technical replicates to remove psuedo-replicates 

meanCulture = mydata.groupby(mydata.culture).mean()
print(meanCulture)

meanGlucose = mydata.groupby(mydata.glucose)["conc","diameter"].mean()
print(meanGlucose)

#Step 4: Creating new columns for diameter and concentration that have a natural log of each, respectively  
mydata = mydata.assign(log_conc = np.log(mydata.conc))

mydata = mydata.assign(log_diameter = np.log(mydata.diameter))

#Step 5 
#Using sns package from seaborn to create scatter plot of log concentration vs log diameter

#Step 6 (BONUS): adding a line for seperation of data
sns_plot = sns.lmplot("log_conc","log_diameter",data=mydata,hue='glucose',legend=False,markers=["o","^"],fit_reg=True,scatter_kws={"s":50})

plt.legend(loc="upper right")

#Saving the output file as a PDF 
sns_plot.savefig("tetrahymena_part_A_From_Python_me1528.pdf")
