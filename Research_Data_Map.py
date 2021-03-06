# Globe Map 2

import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import pandas as pd
import numpy as np


# Importing Coordinate Data
MeanderCoordinates = pd.read_csv("Meandering_River_Coordinates.csv")
BraidedCoordinates = pd.read_csv("Braided_River_Coordinates.csv")
AnastomCoordinates = pd.read_csv("Anastomosing_River_Coordinates.csv")

MeanderCoordinates = MeanderCoordinates.to_numpy()
BraidedCoordinates = BraidedCoordinates.to_numpy()
AnastomCoordinates = AnastomCoordinates.to_numpy()

# Creating the plot size in inches (Width, Height) Original was 10,5
fig = plt.figure(figsize=(20, 10))
ax = fig.add_subplot(1, 1, 1, projection=ccrs.Robinson())

# Setting the image to be the entire globe
ax.set_global()

# Setting the Background image so its not an outline
ax.stock_img()

# Setting Coast Lines
ax.coastlines()

for row in MeanderCoordinates:

    # Obtaining the Long and Lat from the row 
    lat = row[0]
    long = row[1]

    # Long and Lat are added in that order in decimal degrees
    ax.plot(long, lat, marker='o', color='green', markersize=5,
    alpha=0.7, transform=ccrs.Geodetic())

for row in BraidedCoordinates:

    # Obtaining the Long and Lat from the row 
    lat = row[0]
    long = row[1]

    # Long and Lat are added in that order in decimal degrees
    ax.plot(long, lat, marker='s', color='blue', markersize=5,
    alpha=0.7, transform=ccrs.Geodetic())

for row in AnastomCoordinates:

    # Obtaining the Long and Lat from the row 
    lat = row[0]
    long = row[1]

    # Long and Lat are added in that order in decimal degrees
    ax.plot(long, lat, marker='^', color='black', markersize=5,
    alpha=0.7, transform=ccrs.Geodetic())

# plt.title("Modern Rivers")

plt.savefig('ALLrivers.pdf')

plt.show()
