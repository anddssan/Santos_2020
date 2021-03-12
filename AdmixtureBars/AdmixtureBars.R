# The outputs of this script can be found from "Figura 11" (page 79) all
# the way through "Figura 30" (page 101) and in "APÊNDICE C" (pages 
# 140-145) in my PhD Thesis.

# Install the required package if needed.
install.packages("pophelper")

# Set working directory to the folder where ALL.12.Q and ALL.txt files 
# are located. ALL.12.Q is the ADMIXTURE file used, while ALL.txt is a
# file containing the labels at the individuals, populations and 
# projects (ancient, 1kGP or SGDP) levels.
setwd("Path:/To/Folder")

# Load the required package.
library(pophelper)

# Read the Q file.
alist <- readQ(files="ALL.12.Q", indlabfromfile=T)

# Read de labels file.
labels <- read.csv("ALL.txt", header=F, stringsAsFactors=F, sep = "\t")

# Assign the labels to the ADMIXTURE data.
head(alist[[1]])
rownames(alist[[1]]) <- labels$V1
head(alist[[1]])

# Draw bar plots. The individuals are grouped first according to V3 
# (vector/collumn 3 in the ALL.txt file) and then by V1.
qdata1 <- plotQMultiline(alist,grplab=labels[,c(2,3)],ordergrp=T,
                         outputfilename="AdmixtureResults",lpp=4,barsize=1,
                         grplabsize=3,returndata=T,showindlab=T,
                         barbordersize=0.4,useindlab=T,barbordercolour="white",
                         indlabsize=8, showlegend = T)

# The output images were further merged or separated using an image 
# editor (in order to higlight populations or single individuals).
