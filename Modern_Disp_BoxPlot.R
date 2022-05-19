# Modern Dispersion Box Plot Plotting 

# Anthony Semeraro
# 27 Jan 2022

# Reads in csv containing river names, dispersion values, known morphology, and river type 
# and plots the values on a box plot distinguishing the morphologies. 

rm(list = ls())

library(ggplot2)
library(reshape2)
library(gridExtra)

# For only Braided and Meandering Data
# Morphology.df <- read.csv("Modern_250_MCTA.csv", stringsAsFactors = TRUE)

# For 3 morphologies with Braided TA
Morphology.df <- read.csv("Anast3_Meand_Boxplot.csv", stringsAsFactors = TRUE)

# For 3 Morphologies with Meandering TA
# Morphology.df <- read.csv("Modern_250_MCTA_Meand_Anastamosing.csv", stringsAsFactors = TRUE)


str(Morphology.df)

head(Morphology.df)

Morphology.red.df <- Morphology.df[,c(1:3)]
str(Morphology.red.df)

head(Morphology.red.df)

#3color <- c('blue', 'black', 'blue')

# If you want from 0-1, add + ylim(0,1) to the end of the next section
 #p1 <- ggplot(Morphology.red.df,aes(Morphology,Dispersion))+geom_boxplot()+ 
#geom_point(aes(shape = Morphology), size = 2) +
#labs(x = "Morphology", y = "Dispersion") + scale_fill_manual(values = color, labels = "Braided", "Anastomosing", "Meandering")

#p1
 
 
 # Do not use ********


meandering.df <- subset.data.frame(Morphology.red.df, Morphology == "Meandering")

braided.df <- subset.data.frame(Morphology.red.df, Morphology == "Braided")

anastomosing.df

# If you want from 0-1, add + ylim(0,1) to the end of the next section
# p1 <- ggplot(Morphology.red.df,aes(Morphology,Dispersion))+geom_boxplot()+ 
  #geom_point(aes(color = Morphology, shape = Morphology), size = 2) +
  #labs(x = "Morphology", y = "Dispersion")

p1 <- ggplot(meandering.df, aes(Morphology,Dispersion)) + geom_boxplot() + geom_point(color = "green", shape = "M", size = 4) + labs(x = "Morphology", y = "Dispersion")

p2 <- ggplot(braided.df, aes(Morphology,Dispersion)) + geom_boxplot() + geom_point(color = "blue", shape = "B", size = 4) + labs(x = "Morphology", y = "Dispersion")

plot3 <- grid.arrange(p1, p2, nrow = 1, ncol = 2)

