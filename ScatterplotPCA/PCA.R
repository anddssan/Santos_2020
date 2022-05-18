# The outputs of this script can be found as "Figura 31" (page 103) and
# "Figura 32" (page 104) in my PhD Thesis.

# Install the required package if needed.
install.packages("ggplot2")

# Set working directory to the folder where PCA.txt is located.
setwd("Path:/To/Folder")

# Load the required package.
library(ggplot2)

# Read PCA.txt as a dataframe. PCA.txt is a modified output file from
# PLINK PCA function. Specifically, this file contains the eigenvectors
# computed by PLINK during Principal Component Analysis (PCA). Each row
# represents one sample in my dataset followed by their respective
# eigenvectors in the first 20 principal components computed by PLINK.
df <- read.table("PCA.txt", sep = "\t", header = F)

# This command generates "Figura 31"
ggplot(df, aes(V6, V7, colour = V4)) +
  geom_point(size = 1.5) +
  theme_bw() +
  xlab("PC1") +
  ylab("PC2") +
  labs(colour = "Legenda") +
  scale_size(guide = "none") +
  theme(
    axis.title = element_text(face = "bold"),
    legend.title = element_text(face = "bold")
  ) +
  theme(legend.position = c(.95, .1))

# This command generates "Figura 32"
ggplot(df, aes(V6, V7, colour = V5)) +
  geom_point(size = 4.5) +
  theme_bw() +
  xlab("PC1") +
  ylab("PC2") +
  labs(colour = "Legenda") +
  scale_size(guide = "none") +
  theme(
    axis.title = element_text(face = "bold"),
    legend.title = element_text(face = "bold")
  ) +
  theme(legend.position = c(.95, .2)) +
  coord_cartesian(ylim = c(-0.075, 0), xlim = c(-0.05, -0.02)) +
  geom_text(aes(label = V2), hjust = 1, vjust = 2)

# The legend of "Figura 32" was further modified (to present only the
# labels referring to the visible populations in the plot) using an
# image editor.