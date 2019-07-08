#import data from CSV file
#Select GB Employee Assignment Report
library(xlsx)
d <- read.csv(file.choose() , header = T, sep = ",", stringsAsFactors = F)
#cat("Arcadia: ",nrow(d[grep("Arcadia", d$Organisation.Name),]))
#cat("Morrisons Bridgwater: ",nrow(d[grep("Bridgwater", d$Organisation.Name),]))

Arcadia = nrow(d[grep("Arcadia", d$Organisation.Name),])
MorrisonsBridgwater = nrow(d[grep("Bridgwater", d$Organisation.Name),])
GB = nrow(d) - Arcadia - MorrisonsBridgwater
cat("Arcadia: ",Arcadia)
cat("Morrisons Bridgwater: ",MorrisonsBridgwater)
cat("GB: ",GB)