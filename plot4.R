####################
## Set parameters ##
####################

par(mfcol = c(2,2)) # 2 rows x 2 columns, column-wise filling

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

# Select only the 2880 observations where Date equals
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

#-----------------------
# PLOT 1 (TOP LEFT)
#-----------------------

# Type: Lines plot (bivariate).
# Main title = None
# Xlab = none
# Ylab = "Global Active Power (kilowatts)"
# Variable(s) = Global_active_power, Date

with(electric_consumption, 
     plot(
             Global_active_power,
             type = "l", # plot lines
             main = "", # no main title
             xlab = "", # no x label
             ylab = "Global Active Power (kilowatts)",
             xaxt = "n" # don't plot x axis
     ) 
)

# Add customized x axis
axis(
        1, # bottom
        at = c(0,1440,2880), # 1440 minutes in one day
        labels = c("Thu", "Fri", "Sat")
)

#-----------------------
# PLOT 2 (BOTTOM LEFT)
#-----------------------

# Type: Lines plot (multivariate).
# Main title = None
# Xlab = none
# Ylab = "Energy sub metering"
# Variable(s) = Sub_metering_1, 2, and 3

with(electric_consumption, 
     plot(
             Sub_metering_1,
             type = "l", # plot lines
             main = "", # no main title
             xlab = "", # no x label
             ylab = "Energy sub metering",
             xaxt = "n" # don't plot x axis
     ) 
)

# Add customized x axis
axis(
        1, # bottom
        at = c(0,1440,2880), # 1440 minutes in one day
        labels = c("Thu", "Fri", "Sat")
)

# Add lines for sub metering 2
lines(electric_consumption$Sub_metering_2, col = "red")

# Add lines for sub metering 3
lines(electric_consumption$Sub_metering_3, col = "blue")

# Add legend
legend(1300, 42, # position
        
        col = c(
                "black",
                "red",
                "blue"
        ),
        
        lty = 1,
        
        legend = c(
                "Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"
        ),
       cex = 0.75,
       y.intersp = 0.3,
       bty = "n",
       xjust = 0
)

#-----------------------
# PLOT 3 (TOP RIGHT)
#-----------------------

# Type: Lines plot (bivariate).
# Main title = None
# Xlab = None
# Ylab = "Voltage"
# Variable(s) = Voltage

with(electric_consumption, 
     plot(
             Voltage,
             type = "l", # plot lines
             main = "", # no main title
             xlab = "", # no x label
             ylab = "Voltage (V)",
             xaxt = "n" # don't plot x axis
     ) 
)

# Add customized x axis
axis(
        1, # bottom
        at = c(0,1440,2880), # 1440 minutes in one day
        labels = c("Thu", "Fri", "Sat")
)

#-----------------------
# PLOT 4 (BOTTOM RIGHT)
#-----------------------

# Type: Lines plot (bivariate).
# Main title = None
# Xlab = None
# Ylab = "Global_reactive_power"
# Variable(s) = Global_reactive_power

with(electric_consumption, 
     plot(
             Global_reactive_power,
             type = "l", # plot lines
             main = "", # no main title
             xlab = "", # no x label
             ylab = "Global Reactive Power (kilowatts)",
             xaxt = "n" # don't plot x axis
     ) 
)

# Add customized x axis
axis(
        1, # bottom
        at = c(0,1440,2880), # 1440 minutes in one day
        labels = c("Thu", "Fri", "Sat")
)

#==================
# Printing the plot
#==================

# copy the plot from screen to png device
dev.copy(
        png, # set the device
        "plot4.png", # set the filename
        width = 480, # set width
        height = 480 # set height
) 

dev.off() # close the device

rm(electric_consumption) # free memory
