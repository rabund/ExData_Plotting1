## This script is used to trigger the functions needed to
##   - load the data from the source, unpack the text file, loading and cleaning the datat
##   - plot the data
##
## The code is splitted into three script files:
##   - this file contains the controlling of the run, loads the necessary libraries and sources
##   - load_data.R contains the functions to load and clean up the data
##   - plot1.R, plot2.R, plot3.R, plot4.R contains the functions to plot out the graphics

library(data.table)
library(dplyr)

source("load_data.R")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")

## control the processing
## declare the variables
dataDirectory <- ".\\data"
## load the data
downloadData(dataDirectory)
## fetch and clean the data
hpc <- fetchData(dataDirectory)
hpc <- cleanupData(hpc)
## plot the data
plot1(hpc)
plot2(hpc)
plot3(hpc)
plot4(hpc)
