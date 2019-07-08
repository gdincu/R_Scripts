#TBC
#Quarterly report on the headcount of all cost centres within SCS
#The report is to exclude any HR colleagues and to only cover G grades and below only

#import data from CSV file
#Select GB Employee Assignment Report
library(xlsx)
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)
#only keeps SCS records
d <- d[grep("Supply Chain Solutions", d$Level2),]

d$gradeShort <- with(d, if(substrRight(d$Grade.Name, 1) != "B|C|D|E|F") {"No"} else {"Yes"})
d <- d[grep("B|C|D|E|F", d$gradeShort),]

#Export to Excel
library(xlsx)
write.xlsx(d, file.choose(), sheetName="Data")