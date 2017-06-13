# Download data from: https://dataverse.harvard.edu/dataverse.xhtml?alias=prenatal
Fetus <- read.table("Face_Dataverse.tab",header=T,skip=1)
Fetus <- Fetus[-c(40:43),] # Delete blank rows
Fetus

Fdata <- Fetus[8:11]
colnames(Fdata) <- c("UpTowards", "UpAway", "InvTowards", "InvAway") # Rename columns
# Age
apply(Fetus[2], 2, min) # 231, Consistent with p.e1
apply(Fetus[2], 2, max) # 252, Consistent with p.e1
apply(Fetus[2], 2, mean) # 240.6154, Consistent with p.e1
# Maternal Tissue Thickness 
apply(Fetus[4], 2, mean) # 27.46667,Consistent with p.e1
apply(Fetus[4], 2, sd) # 10.31844, Consistent with p.e1
# Behavioral data
apply(Fdata, 2, mean) # Inconsistent with p.1  UpTowards     UpAway InvTowards    InvAway 
                                              #1.0256410  0.2564103  0.4358974  0.3589744 
apply(Fdata, 2, sd) # Inconsistent with p.1    UpTowards     UpAway InvTowards    InvAway 
                                              #1.0879043  0.4983102  0.5980174  0.5843205 

# Test
library(coin)
wilcoxsign_test(Fdata$UpTowards ~ Fdata$UpAway, distribution = "exact",
                alternative = "greater")
wilcoxsign_test(Fdata$InvTowards ~ Fdata$InvAway, distribution = "exact",
                alternative = "greater")
wilcoxsign_test(Fdata$UpTowards ~ Fdata$InvTowards, distribution = "exact",
                alternative = "greater")
wilcoxsign_test(Fdata$UpAway ~ Fdata$InvAway, distribution = "exact",
                alternative = "greater")
