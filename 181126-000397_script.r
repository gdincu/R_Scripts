#####################################################################################
#1st Report - All current employees
#Employee Full Name, Employee Number
#####################################################################################

#Import data from the GB Employee Home Address Report
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F) 

#Only keep 4 columns
d <- d[ , (names(d) %in% c("Employee.Full.Name","Employee.Number","POST_CODE","Addr.Country"))]

#Adding a blank Mgt Unit column
d$Comments <- ""

#Rename column headers
names(d)[1] <- "Employee Name"
names(d)[2] <- "Employee Number"
names(d)[3] <- "Postcode"
names(d)[4] <- "Country"

#Export to Excel
library(xlsx)
write.xlsx(d, file.choose(), sheetName="Current Employees",row.names="FALSE")

#Delete the current dataframe
rm(list=ls())
#####################################################################################
#Import data from the IE Employee Home Address Report 
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F) 

#Only keep 4 columns
d <- d[ , (names(d) %in% c("Employee.Full.Name","Employee.Number","Town.or.City","Country"))]

#Adding a blank Mgt Unit column
d$Comments <- ""

#Rename column headers
#names(d)[1] <- "Employee Name"
#names(d)[2] <- "Employee Number"
#names(d)[3] <- "Postcode"

#Export to Excel
write.xlsx(d, file.choose(), sheetName="IE Current Employees",row.names="FALSE")

#####################################################################################
#Delete all current variables
rm(list=ls())
#####################################################################################