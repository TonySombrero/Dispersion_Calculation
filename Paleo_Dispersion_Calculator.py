# Paleo Dispersion Calculator

# Anthony Semeraro
# 27 Jan 2022

# Paleo Dispersion Calculation 

import pandas as pd
import numpy as np
import math

#%% Loading in Data

# Paleocurrent Data *** RENAME OUTPUT FILE ***
riverdata = pd.read_csv("CMCardenas.csv")

# Columns becomes an index of the column names, each name individually is a string
columns = riverdata.columns

# Creating empty lists to hold data during loop
dispersion_file = []
dispersion_name = []

i = 0

for column in columns:

    riverlist = riverdata[columns[i]].tolist()

    # Removing NaN values from list
    river1 = [x for x in riverlist if pd.isnull(x) == False]

    # Math Section

    # Splitting the x and y components using a lambda x function 
    cosine_X = lambda x: math.cos(math.radians(x))
    cosine   = np.array([cosine_X(xi) for xi in river1])

    sine_Y   = lambda x: math.sin(math.radians(x))
    sine     = np.array([sine_Y(xi) for xi in river1])

    # Getting the average of the x and y components
    avg_cosine = np.average(cosine)
    avg_sine   = np.average(sine)

    #Calculates Dispersion Value
    disp_value = math.sqrt((avg_cosine**2)+(avg_sine**2))

    # Appending the river names and dispersion values to the lists created above
    dispersion_name.append(column)
    dispersion_file.append(disp_value)

    print(column)
    print(disp_value)

    # Initiating the loop for the next river in the dataset
    i = i + 1

# Creating a dictionary of river name and dispersion value 
dic = {"Dispersion": dispersion_name, "River": dispersion_file}

# Creating a dataframe from the dictionary 
df = pd.DataFrame(dic)

# Creating the final CSV document. Need to change name or else it overrides it each run
df.to_csv("CMCardenas_Dispersion.csv")

print("Program has succesfully completed")
