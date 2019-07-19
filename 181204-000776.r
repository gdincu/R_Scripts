#uses "GB Employee Home Address Report with Missing Details Filter"
#import data from the "SG copy of GB Employee Assignment Report with Contract Screen"
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)

#Only keep the necessary columns
d <- d[ , (names(d) %in% c("Organization.Name","Employee.Full.Name","Employee.Number","Address.Line1","Address.Line2","Address.Line3","ADDR_CITY","Addr_County","POST_CODE","Addr.Country","Phone_Number"))]

#Only keep records with "GBMD30.11480.100536.106 Long Eaton - M&S Warehouse M&S GM Warehouse" in their cost centre
d <- d[grep("GBMD30.11480.100536.106 Long Eaton - M&S Warehouse M&S GM Warehouse", d$Organization.Name),]

#Rename column headers
names(d)[1] <- "Organisation Name"
names(d)[2] <- "Employee Name"
names(d)[3] <- "Address Line1"
names(d)[4] <- "Address Line2"
names(d)[5] <- "Address Line3"
names(d)[6] <- "Address Line4"
names(d)[7] <- "Address Line5"
names(d)[8] <- "Postcode"
names(d)[9] <- "Country"
names(d)[10] <- "Phone_Number"

#Export to CSV
write.table(d, file = file.choose(),row.names=FALSE, na="",col.names=T, sep=",")

#Delete all current objects
rm(list=ls())