# Dispersion Calculation

Anthony Semeraro

17 Jan 2022 

## Table of Contents
* [Introduction](Introduction)
* [Technologies](Technologies)
* [Thesis Abstract](Thesis_Abstract)

## Introduction

This repository holds my scripts for my masters thesis project. The aim of this project is to use modern rivers as an analog to put bounds on morphology that can be used to find ancient river system morphology. See abstract attached below for a bit more background on my research. 

## Technologies

Python 3.9 
R 4.0.4

## Thesis Abstract

Large scale fluvial depositional systems predominantly fall into either a meandering or braided end-member morphology. Distinguishing between these two morphologies in sedimentary deposits is tenuous given overlapping channels, eroded sections, and poor exposure. Fluvial deposits preserve bedform structures, imbrication patterns, and fossils that record the paleocurrent flow direction. Paleocurrent measurements, traditionally used for mean flow direction of ancient fluvial systems, have been used to uncertainly infer morphology. Circular statistics provides a quantitative measurement of the density and spread of directions a river flows captured in the calculation of a dispersion value. This paper concludes that this dispersion value can accurately distinguish between meandering and braided river systems in sedimentary deposits. 

To find ranges of dispersion values for each morphology of river, a database of 100 modern end-member meandering and braided rivers was created. By measuring channel azimuth directions 250 times over specific sections of these rivers, synthetic current measurements representing modern paleocurrents were created. To replicate natural variation found within natural fluvial system bedforms, a transport anomaly value that represents the difference between bedform measurements and the channel axis direction, were added to each synthetic modern current direction measurement. Using these naturalized modern current direction measurements, value ranges of dispersion were calculated for each set of modern rivers. Dispersion values from 0.8 to 0.6 represented braided river systems, and value ranges from 0.6 to 0.3 represent meandering river systems. Furthermore, within meandering rivers, dispersion value can be used to estimate sinuosity. As dispersion quantifies the range of directions that a river flows; a relationship between dispersion and sinuosity is present over the same stretch of river. Each section of the modern meandering rivers used to measure dispersion were also used to measure sinuosity. Dispersion values for meandering systems plotted with their attached sinuosity, show a relatively strong relationship with a R^2 value of 0.92. Modern river current datasets appear reliable enough to apply to ancient river systems in constraining planform morphologies. 


