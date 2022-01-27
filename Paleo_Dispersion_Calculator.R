# Paleocurrent Dispersion Calculator

# Anthony Semeraro
# 27 Jan 2022

# Reads in .csv of paleocurrent measurements. Checks the dataset for uniformity, calculates dispersion, 
# and mean vector direction.

# ***Only use for paleocurrent measurements*** 

rm(list = ls())

library(ggplot2)
library(GGally)
library(reshape2)
library(circular)

River.df <- read.csv("River.csv", stringsAsFactors = TRUE)
# Change the name of the csv to the one with data that your are running. 

River.df <- na.omit(River.df)
# Remove any NaN values in the dataset. 

for (i in colnames(River.df)){

  data.circular = circular(River.df[i], units = "degrees", template = "geographics", modulo = "2pi")
  # Converts data to circular

  Uniformity <- rao.spacing.test(data.circular,alpha=.10)
  # Raos spacing test for uniformity. If dataset does not have a uniform direction, the dispersion value calculated will not
  # represent a river system. 

  Dispersion <- rho.circular(data.circular)
  # Calculating dispersion

  Direction <- mean.circular(data.circular)
  # Calculating mean vector direction

  print(i)
  # Displays River Datasets Name

  print(Uniformity)

  print(Dispersion)

  print(Direction)
}


# rose.diag(River.df[1], bins = 36)
# Plots a rose diagram of the dataset split into 10 degree bins
