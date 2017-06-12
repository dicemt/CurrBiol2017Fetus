# Download data from: https://dataverse.harvard.edu/dataverse.xhtml?alias=prenatal
Fetus <- read.table("Face_Dataverse.tab",header=T,skip=1)
Fetus <- Fetus[-c(40:43),] # Delete blank rows
Fetus

Fdata <- Fetus[8:11]
colnames(Fdata) <- c("UpTowards", "UpAway", "InvTowards", "InvAway") # Rename columns
# Age
apply(Fetus[2], 2, min) # Consistent with p.e1
apply(Fetus[2], 2, max) # Consistent with p.e1
apply(Fetus[2], 2, mean) # Consistent with p.e1
# Maternal Tissue Thickness 
apply(Fetus[4], 2, mean) # Consistent with p.e1
apply(Fetus[4], 2, sd) # Consistent with p.e1
# Behavioral data
apply(Fdata, 2, mean) # Inconsistent with p.1
apply(Fdata, 2, sd) # Inconsistent with p.1

# Test
wilcoxsign_test(Fdata$UpTowards ~ Fdata$UpAway, distribution = "exact",
                alternative = "greater")
wilcoxsign_test(Fdata$InvTowards ~ Fdata$InvAway, distribution = "exact",
                alternative = "greater")
wilcoxsign_test(Fdata$UpTowards ~ Fdata$InvTowards, distribution = "exact",
                alternative = "greater")
wilcoxsign_test(Fdata$UpAway ~ Fdata$InvAway, distribution = "exact",
                alternative = "greater")
