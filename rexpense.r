## Collect arguments
args <- commandArgs(TRUE)

# data file to be used.
filename <- "data/usable.csv"

# default variables  and args intake
source("default.r")

# iterate the data with params in iter.r
source("iter.r")

## save the data and create pictures using write.r
source("plot.r")

