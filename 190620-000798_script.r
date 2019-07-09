#1st Report - All people in the business with the following headings: 
#Employee Full Name, Employee Number, Job Category, Management Unit

#import data from CSV file
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)

#Only keep 4 columns
d <- d[ , (names(d) %in% c("Employee.Name","Employee.Number","Employee.Category","Organisation.Name"))]

#Adds an extra row with the Management Unit
d$Management.Unit <- with(d,substr(d$Organisation.Name,8,12))
#Removes the Organisation.Name column
d <- d[ , !(names(d) %in% c("Organisation.Name"))]

#Trim values in the Job Category column
d$Employee.Category[d$Employee.Category==" "] <- "-"

#Rename column headers
names(d)[1] <- "Employee Name"
names(d)[2] <- "Employee Number"
names(d)[3] <- "Employee Category"
names(d)[4] <- "Management Unit"

#Export to Excel
library(xlsx)
write.xlsx(d, file.choose(), sheetName="All Employees")

#Delete all current variables
rm(list=ls())
