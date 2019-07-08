#import data from CSV file
#Select GB Employee Assignment Report
myFile <- file.choose()
d <- read.csv(file=myFile , header = T, sep = ",", stringsAsFactors = F)

#Filter data by Org
d <- d[grep(".13166.|.10719.|.10720.", d$Organisation.Name),]

#Export to excel
#install.packages("xlsx")
#install package if not available
library(xlsx)
write.xlsx(d, file.choose(), sheetName="Data")





