# Paleocurrent Dispersion Calculator

# Anthony Semeraro
# 27 Jan 2022

# Reads in .csv of paleocurrent measurements. Checks the dataset for uniformity, calculates dispersion, 
# and mean vector direction.

# ***Only use for paleocurrent measurements*** 


# *** DO NOT USE THIS CURRENTLY, IT DOES NOT RELIABLY RETURN THE CORRECT DISPERSION VALUE ***

# *** UNDER REVIEW *** # 
rm(list = ls())

library(ggplot2)
library(GGally)
library(reshape2)
library(circular)

library(diptest)

River.df <- read.csv("Hanna_Basin.csv", stringsAsFactors = TRUE)
# Change the name of the csv to the one with data that your are running. 

River.df <- na.omit(River.df)
# Remove any NaN values in the dataset. 

for (i in colnames(River.df)){

  data.circular = circular(River.df[i], units = "degrees", template = "geographics", modulo = "2pi")
  # Converts data to circular

  Uniformity <- rao.spacing.test(data.circular,alpha=.05)
  # Raos spacing test for uniformity. If test of uniformity is Rejected, the dataset most likely is a 
  # river system

  Dispersion <- rho.circular(data.circular)
  # Calculating dispersion

  # Direction <- mean.circular(data.circular)
  # Calculating mean vector direction
  
  Modality <- dip.test(data.circular)

  Disp <- modal.region(data.circular)
  
  print(i)
  # Displays River Datasets Name

  print(Uniformity)

  print(Dispersion)

  # print(Direction)
  
  print(Modality)
  
  print(Disp)
  
}

rose.diag(River.df[1], bins = 36)
# Plots a rose diagram of the dataset split into 10 degree bins

