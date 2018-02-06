##############
##  PLOT 1  ##
##############

# Type: histogram (univariate).
# Main title = "Global Active Power"
# Xlab = "Global Active Power (kilowatts)"
# Ylab = "Frequency"
# Variable(s) = electric_consumption$Global_active_power

par(mfrow = c(1,1)) # reset parameters

#=================
# Reading the data
#=================

require(dplyr)

data <- read.csv("~/Downloads/household_power_consumption.txt",
                 sep = ";",
                 na.strings = "?",
                 stringsAsFactors = FALSE
)

data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date)

# Select only the 2880 observations from data where Date equals
# February 01 and 02, 2007
electric_consumption <- subset(
        data,
        Date == "2007-02-01" | Date == "2007-02-02"
)

rm(data) # free memory

# Join date and time values together
datetime <- paste(
        electric_consumption$Date,
        electric_consumption$Time
)

# Assign joined values of date and time to Date column
electric_consumption$Date <- datetime

rm(datetime) # free memory

# Parse character as date type
electric_consumption$Date <- strptime (
        electric_consumption$Date,
        "%Y-%m-%d %H:%M:%S"
)

# ... continuing...
electric_consumption$Date <- as.Date(
        electric_consumption$Date
)

#=================
# Plotting
#=================

hist(
        electric_consumption$Global_active_power, # Create a histogram from global_active_power variable
        col = "red", # Paint bins in red
        xlab = "Global Active Power (kilowatts)", # Add label to x axis
        ylab = "Frequency", # Add label to y axis
        main = "Global Active Power" # Add main title
)

#==================
# Printing the plot
#==================

# copy the plot from screen to png device
dev.copy(
        png, # set the device
        "plot1.png", # set the filename
        width = 480, # set width
        height = 480 # set height
        ) 

dev.off() # close the device

rm(electric_consumption) # free memory
