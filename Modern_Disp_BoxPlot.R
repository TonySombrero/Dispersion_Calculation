# Modern Dispersion Box Plot Plotting 

# Anthony Semeraro
# 27 Jan 2022

# Reads in csv containing river names, dispersion values, known morphology, and river type 
# and plots the values on a box plot distinguishing the morphologies. 

rm(list = ls())

library(ggplot2)
library(reshape2)

Morphology.df <- read.csv("Modern_250_MCTA.csv", stringsAsFactors = TRUE)

str(Morphology.df)

head(Morphology.df)

Morphology.red.df <- Morphology.df[,c(1:3)]
str(Morphology.red.df)

head(Morphology.red.df)

p1 <- ggplot(Morphology.red.df,aes(Morphology,Dispersion))+geom_boxplot()+ 
  geom_point(aes(color = Morphology, shape = Morphology), size = 2) +
  labs(x = "Morphology", y = "Dispersion") + ylim(0,1)

p1