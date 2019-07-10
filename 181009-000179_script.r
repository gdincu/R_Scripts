#####################################################################################
#TO DO
#####################################################################################

#import data from the GB All Absences with Date Range
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)
d2 <- d

#Only keep the necessary columns
d <- d[ , (names(d) %in% c("Organisation","Full.Name","Employee.Number","Absence.Type","Date.Start","Date.End"))]

#Remove records without an end date
d$Date.End[d$Date.End==""]<-"TEST"
d <- d[!grepl("TEST", d$Date.End),]

#Adds an extra row with the nr of days off

networkdays <- function(start, end, holidays) { 
dates <- seq(as.Date(start), as.Date(end), by="day")

if(missing(holidays))holidays <- 0 else holidays <- length(holidays) sum(as.numeric(format(dates, "%w") > 1)) - holidays }

#install.packages('anytime')
library(anytime)
d$calculated <- with(d,networkdays(anydate(d$Date.Start),anydate(d$Date.End)))

#Only keep records with 90+ calculated days
d <- with(d, d$calculated >= 90)

#Export to Excel
library(xlsx)
write.xlsx(d, file.choose(), sheetName="Data With End Date",row.names="FALSE")
#write.xlsx(d2, file.choose(), sheetName="Data No End Date", append=TRUE,row.names="FALSE")

#Delete the current dataframe
rm(list=ls())