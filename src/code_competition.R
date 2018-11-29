###                                             ###
### 15.459 Financial Data Science and Computing ###
###             Youssef Berrada                 ###
###             yberrada@mit.edu                ###
###                Fall 2018                    ###

library(data.table)
library(tidyverse)

output = fread('/Users/youssefberrada/Desktop/output-results.csv')
colnames(output) = c('id','article','CCAT','ECAT','GCAT','MCAT')

output = output %>%
  select(CCAT,ECAT,GCAT,MCAT)%>%
  sapply(as.numeric)

pred = fread('/Users/youssefberrada/Downloads/firstname_lastname.csv')

pred = pred %>%
  select(CCAT,ECAT,GCAT,MCAT)%>%
  sapply(as.numeric)

# This is a pooled Micro-average Accuracy measure
CM = as.matrix(table(Actual = output, Predicted = pred))
accuracy = sum(diag(CM))/sum(CM)
accuracy

