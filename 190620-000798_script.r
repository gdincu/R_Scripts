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
d$Employee.Category[d$Employee.Category=="50 Management"]<-"Management"
d$Employee.Category[d$Employee.Category=="20 Other Operator"]<-"Other Operator"
d$Employee.Category[d$Employee.Category=="70 Clerical - General"]<-"Clerical"
d$Employee.Category[d$Employee.Category=="40 Other"]<-"Other"
d$Employee.Category[d$Employee.Category=="65 Management - Supervisory"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="63 Engineer - Supervisory"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="30 Engineer"]<-"Engineer"
d$Employee.Category[d$Employee.Category=="60 Supervisory"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="71 Ops Clerk"]<-"Clerical"
d$Employee.Category[d$Employee.Category=="67 Clerical - Supervisory"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="45 Indirect Staff"]<-"Indirect Staff"
d$Employee.Category[d$Employee.Category=="47 Other Ops"]<-"Other"
d$Employee.Category[d$Employee.Category=="00 Driver"]<-"Driver"
d$Employee.Category[d$Employee.Category=="80 First Line Manager"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="51 Sales Staff"]<-"Sales"
d$Employee.Category[d$Employee.Category=="64 Other / Misc - Supervisor"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="27 Maintenance Op-Premises"]<-"Maintenance"
d$Employee.Category[d$Employee.Category=="90 Board Member"]<-"Board Member"
d$Employee.Category[d$Employee.Category=="62 Other Op - Supervisory"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="55 Warehouse Line Managers"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="23 Yard Staff"]<-"Yard Staff"
d$Employee.Category[d$Employee.Category=="61 Driver - Supervisory"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="10 Driver's Assistant"]<-"Driver's Assistant"
d$Employee.Category[d$Employee.Category=="41 Warehouse Clerks"]<-"Clerical"
d$Employee.Category[d$Employee.Category==""]<-"-"
d$Employee.Category[d$Employee.Category=="48 Warehouse Cleaners"]<-"Cleaner"
d$Employee.Category[d$Employee.Category=="26 Cleaner"]<-"Cleaner"
d$Employee.Category[d$Employee.Category=="00 Shunter Driver"]<-"Driver"
d$Employee.Category[d$Employee.Category=="54 Bonus Supervisors"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="43 Stock Clerks"]<-"Clerical"
d$Employee.Category[d$Employee.Category=="49 Plant Maintenance"]<-"Maintenance"
d$Employee.Category[d$Employee.Category=="24 Security Staff"]<-"Security"
d$Employee.Category[d$Employee.Category=="33 PDI Mechanics"]<-"Maintenance"
d$Employee.Category[d$Employee.Category=="53 Bond Managers"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="Clerical"]<-"Clerical"
d$Employee.Category[d$Employee.Category=="46 Indirect Checkers"]<-"Other"
d$Employee.Category[d$Employee.Category=="44 Bond Clerks"]<-"Clerical"
d$Employee.Category[d$Employee.Category=="Supervisor"]<-"Supervisory"
d$Employee.Category[d$Employee.Category=="22 PDI Operatives"]<-"Other"
d$Employee.Category[d$Employee.Category=="Admin. Clerks"]<-"Clerical"

#Rename column headers
names(d)[1] <- "Employee Name"
names(d)[2] <- "Employee Number"
names(d)[3] <- "Employee Category"
names(d)[4] <- "Management Unit"

#Export to Excel
library(xlsx)
write.xlsx(d, file.choose(), sheetName="All Employees",row.names=FALSE,password="PS999201")
write.xlsx(d2, file.choose(), sheetName="sheet2", append=TRUE, row.names=FALSE)

#Delete all current variables
rm(list=ls())
