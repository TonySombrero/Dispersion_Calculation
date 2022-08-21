# General dispersion calculation script

# Anthony Semeraro

# 20 Aug 2022

#%% Variables to Define

# Process with Transport Anomaly Added
TA = 1

# Set number of Monte Carlo iterations
MC = 500

# Define File Name
filename = "Scotts_Sinuous.csv"

#%% Importing Libraries

import pandas as pd
import numpy as np
import math

#%% Read In Files

river_df = pd.read_csv(filename)

#%% Transport Anomaly

def TA():
    # Assigning Transport Anomaly datasets for the modern data morphologies
    Morphology = input("Please enter River Morphology. A for Anastomosing, B for Braided, M for Meandering:")

    if Morphology == 'A':
        TA = input("Please enter morphology of Transport Anomaly to be used. B for Braided, M for Meandering:")

        if TA == "M":
            ta = pd.read_csv("Bedform_Trinity_Meandering.csv")

        if TA == "B":
            ta = pd.read_csv("Bedform_Northloup_Braided.csv")

    elif Morphology == 'B':
        ta = pd.read_csv("Bedform_Northloup_Braided.csv")

    elif Morphology == 'M':
        ta = pd.read_csv("Bedform_Trinity_Meandering.csv")

    else:
        print("Invalid input")

#%% Math

def Dispersion(series):

    
