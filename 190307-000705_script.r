#####################################################################################
#Apprentice Report - To do
#####################################################################################

#import data from the "SG copy of GB Employee Assignment Report with Contract Screen"
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)

#Only keep the necessary columns
d <- d[ , (names(d) %in% c("Level2","Level5","Employee.Number"))]

#Export to CSV
write.table(d, file = file.choose(),row.names=FALSE, na="",col.names=T, sep=",")

#Delete all current objects
rm(list=ls())