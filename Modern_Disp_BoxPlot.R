# Modern Dispersion Box Plot Plotting 

# Anthony Semeraro
# 27 Jan 2022

# Reads in csv containing river names, dispersion values, known morphology, and river type 
# and plots the values on a box plot distinguishing the morphologies. 

rm(list = ls())

library(ggplot2)
library(reshape2)

# For only Braided and Meandering Data
# Morphology.df <- read.csv("Modern_250_MCTA.csv", stringsAsFactors = TRUE)

# For 3 morphologies with Braided TA
Morphology.df <- read.csv("Modern_250_MCTA_Braid_Anastamosing.csv", stringsAsFactors = TRUE)

# For 3 Morphologies with Meandering TA
# Morphology.df <- read.csv("Modern_250_MCTA_Meand_Anastamosing.csv", stringsAsFactors = TRUE)


str(Morphology.df)

head(Morphology.df)

Morphology.red.df <- Morphology.df[,c(1:3)]
str(Morphology.red.df)

head(Morphology.red.df)


# If you want from 0-1, add + ylim(0,1) to the end of the next section
p1 <- ggplot(Morphology.red.df,aes(Morphology,Dispersion))+geom_boxplot()+ 
  geom_point(aes(color = Morphology, shape = Morphology), size = 2) +
  labs(x = "Morphology", y = "Dispersion")

p1
