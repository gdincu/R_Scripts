#####################################################################################
#1st Report - GB New Hire Report
#####################################################################################

#import data from the GB New Hire Report
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)

#Only keep 4 columns
d <- d[ , (names(d) %in% c("Level0","Level1","Level2","Level3","Level4","Level5","Level6","Organisation.Name","Employee.Name","Employee.Number","Assignment.Number","Date.Of.Hire","Adjusted.Service.Date","Date.Of.Birth","Length.Of.Service","Job.Name","Position.Title","Location.Name"
))]

#Only keep records with ".Information Technology." in their job string
d <- d[grep(".Information Technology.", d$Job.Name),]

#Rename column headers
names(d)[8] <- "Organisation Name"
names(d)[9] <- "Employee Name"
names(d)[10] <- "Employee Number"
names(d)[11] <- "Assignment Number"
names(d)[12] <- "Date Of Hire"
names(d)[13] <- "Adjusted Service Date"
names(d)[14] <- "Date Of Birth"
names(d)[15] <- "Length Of Service"
names(d)[16] <- "Job Name"
names(d)[17] <- "Position Title"
names(d)[18] <- "Location Name"

#Export to Excel
library(xlsx)
write.xlsx(d, file.choose(), sheetName="Data",row.names="FALSE")

#Delete the current dataframe
rm(list=ls())