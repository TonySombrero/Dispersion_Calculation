# CSV Practice Script 
# Anthony Semeraro
# 17 Jan 2022

" This script reads in .csv files with a modern rivers name and n polar current measurements. It also read in a file of Transport"
" Anomaly data collected and processed by Dr. Benjamin Cardenas. Make sure to select the river morphology that you are processing."
" This script is only to be used for modern river current measurements, as the TA is automatically added which paleocurrent data does"
" does not need added."

#%% Importing module

import pandas as pd
import numpy as np
import math

#%% Loading in Data

# Braided Rivers 
# riverdata = pd.read_csv("Braided_250_Modern_Currents.csv") 

# Meandering Rivers 
riverdata = pd.read_csv("Meandering_250_Modern_Currents.csv") 

# TA data for Braided Rivers -> Data Frame
# ta = pd.read_csv("Bedform_Northloup_Braided.csv")

# TA data for Meandering Rivers -> Data Frame
ta = pd.read_csv("Bedform_Trinity_Meandering.csv")

# Columns becomes an index of the column names, each name individually is a string
columns = riverdata.columns
ta_columns = ta.columns
ta_Columns = ta[ta_columns[0]].tolist()

# Creating empty lists to hold data during loop
dispersion_file = []
dispersion_name = []

#%% Initiating the main loop
i = 0

for column in columns:

    River1 = riverdata[columns[i]].tolist()

    # Initiating Monte Carlo Loop
    Monte_Carlo = 500
    disp = []
    while Monte_Carlo >= 1:

        lencolumn = len(River1)
        rand_samp_anomaly = np.random.choice(ta_Columns, lencolumn)
        current_anomaly = rand_samp_anomaly + River1

        # Math Section

        # Splitting the x and y components using a lambda x function 
        cosine_X = lambda x: math.cos(math.radians(x))
        cosine   = np.array([cosine_X(xi) for xi in current_anomaly])

        sine_Y   = lambda x: math.sin(math.radians(x))
        sine     = np.array([sine_Y(xi) for xi in current_anomaly])

        # Getting the average of the x and y components
        avg_cosine = np.average(cosine)
        avg_sine   = np.average(sine)

        #Calculates Dispersion Value
        disp_value = math.sqrt((avg_cosine**2)+(avg_sine**2))

        # Appends the dispersion value to the list created above
        disp.append(disp_value)

        # Initiates the next iteration of the Monte Carlo loop
        Monte_Carlo -= 1

    # Finding the average dispersion value for each river from the 500 iterations and rounding to 3 decimal points
    averagedisp = sum(disp) / len(disp)
    averagedisp = round(averagedisp,3)

    # Appending the river names and dispersion values to the lists created above

    dispersion_name.append(column)
    dispersion_file.append(averagedisp)

    # Initiating the loop for the next river in the dataset
    i = i + 1

# Creating a dictionary of river name and dispersion value 
dic = {"Dispersion": dispersion_name, "River": dispersion_file}

# Creating a dataframe from the dictionary 
df = pd.DataFrame(dic)

# Creating the final CSV document. Need to change name or else it overrides it each run
df.to_csv("Meandering_250_Dispersion_TAMC.csv")

print("Program has succesfully completed")
