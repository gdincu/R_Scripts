#Quarterly report on the headcount of all cost centres within SCS
#The report is to exclude any HR colleagues and to only cover G grades and below only

#import data from CSV file
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)

#Removes the Site Leader Column
d <- d[ , !(names(d) %in% c("Site.Leader"))]

#only keeps SCS records
d <- d[grep("Supply Chain Solutions", d$Level2),]

#Adds an extra row with the last letter of the grade
d$gradeShort <- with(d,substr(d$Grade.Name,nchar(d$Grade.Name),nchar(d$Grade.Name)))

#Removes rows with grades above F
d <- d[grep("P|O|N|M|L|K|J|I|H|G", d$gradeShort), ]
#Removes the gradeShort column
d <- d[ , !(names(d) %in% c("gradeShort"))]

#only keeps records with Human Resources in their position Title
d <- d[grep("Supply Chain Solutions", d$Level2),]

#Export to Excel

library(xlsx)
write.xlsx(d, file.choose(), sheetName="Data")

#Delete all current variables
rm(list=ls())
