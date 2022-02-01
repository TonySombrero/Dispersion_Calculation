# Modern River Dispersion Subsampling Plotting

# Anthony Semeraro
# 24/June/2021

# Script reads in dispersion calculations from datasets sub-sampled from 250 measurements down to 5

rm(list = ls())

library(ggplot2)
library(tidyr)

# Reading in the two dispersion datasets

Meandering.df <- read.csv("Meandering_250_Subsample.csv", stringsAsFactors = TRUE)
Braided.df <- read.csv("Braided_250_Subsample.csv", stringsAsFactors = TRUE)

# Convert the dataframes into long format for easy plotting. 

Meandering.long <- Meandering.df %>%
  pivot_longer(Amazon:Rio_Madidi, names_to = "River", values_to = "Dispersion")

Braided.long <- Braided.df %>%
  pivot_longer(Ashburton:Knik, names_to = "River", values_to = "Dispersion")

# Creating Plots

p.disp <- ggplot(data=Meandering.long, mapping=aes(x=Sample, y=Dispersion, color = "blue", shape = River))+
  geom_line() +
  theme(legend.position = "none") +
  geom_path(data= Braided.long, mapping = aes(x=Sample, y= Dispersion, color = "red", shape = River)) 

p.disp

# Plotting with individual river datasets
#
# Section Updated by Anthony Semeraro
#25/June-21

River1.df <- read.csv("15-Mile-EX-1.csv", stringsAsFactors = TRUE)
River2.df <- read.csv("15-Mile-EX-1_Synthetic.csv", stringsAsFactors = TRUE)

# Convert the dataframes into long format for easy plotting. 

River1.long <- River1.df %>%
  pivot_longer(X15.Mile.EX.1, names_to = "River", values_to = "Dispersion")

River2.long <- River2.df %>%
  pivot_longer(X15.Mile.EX.1, names_to = "River", values_to = "Dispersion")

# Creating Plots

p.river <- ggplot(data=Meandering.long, mapping=aes(x=Sample, y=Dispersion, color = "yellow"))+
  geom_line() +
  theme(legend.position = "none") +
  geom_path(data= Braided.long, mapping = aes(x=Sample, y= Dispersion, color = "black")) +
  geom_path(data= River1.long, mapping = aes(x=Sample, y= Dispersion, color = "green", shape = River)) +
  geom_line(data= River2.long, mapping = aes(x=Sample, y= Dispersion, color = "black", shape = River))

p.river




