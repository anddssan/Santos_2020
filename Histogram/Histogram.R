# The output of this script can be found as "Figura 7" (page 71) in my
# PhD Thesis.

# Set working directory to the folder where SNPsNS.csv file is located.
setwd("Path:/To/Folder")

# Load SNPsNS.csv file into a dataframe - This may take a while. The
# file is a list of chromosomal positions of all the SNPs (n>31 million)
# initially genotyped for the whole sample set (n=219 ancient american
# individuals) analyzed in my PhD Thesis research, followed by the
# number of samples (NS) that harbored data about that specific SNP.
df <- read.csv("SNPsNS.csv", header = TRUE)

# Plot the histogram.
hist(df$NS,
     xlab = expression(bold("Number of individuals")),
     ylim = c(0, 4000000), ylab = expression(bold("Quantity of SNPs")),
     xlim = c(0, 210), col = "red", axes = F, main = NA, breaks = 0.5:205.5
)

# Add x-axis ticks and labels.
axis(side = 1, at = seq(0, 210, 10), labels = seq(0, 210, 10))

# Change the notation of the numbers in the y-axis tick labels.
options(scipen = 20)

# Add y-axis ticks and labels.
axis(
     side = 2, at = seq(0, 4000000, 1000000),
     labels = seq(0, 4000000, 1000000)
)

# (Optional) Draw a threshold line on the plot - The threshold used was
# 20% of n, i.e., only considered the SNPs which data was available for
# more than 20% of the analyzed samples. Thus, if n=219, the
# threshold=43.8. Therefore, only SNPs which data was available for 44
# or more individuals was considered for further analyses.
abline(v = 43, col = "blue", lwd = 3, lty = 2)