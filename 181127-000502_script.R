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
d <- d[!grepl("B|C|D|E|F", d$gradeShort), ]
#Removes the gradeShort column
d <- d[ , !(names(d) %in% c("gradeShort"))]

#Removes records with "HR " in their position Title
d <- d[!grepl("HR ", d$Position.Title),]
#Removes records with Human Resources in their Job Title
d <- d[!grepl(".Human Resources.", d$Job.Name),]

#Export to Excel
library(xlsx)
write.xlsx(d, file.choose(), sheetName="Data")

#Delete all current variables
rm(list=ls())
