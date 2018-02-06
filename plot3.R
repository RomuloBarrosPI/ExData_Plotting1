##############
##  PLOT 3  ##
##############

# Type: Lines plot (multivariate).
# Main title = "None"
# Xlab = none
# Ylab = "Energy sub metering"
# Variable(s) = Sub_metering_1, 2, and 3

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

with(electric_consumption, 
     plot(
             Sub_metering_1,
             type = "l",
             main = "",
             xlab = "",
             ylab = "Energy sub metering",
             xaxt = "n"
     ) 
)

axis(1,at = c(0,1440,2880),labels = c("Thu", "Fri", "Sat"))

lines(electric_consumption$Sub_metering_2, col = "red")

lines(electric_consumption$Sub_metering_3, col = "blue")

legend('topright', # position
       
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
       )
)

#==================
# Printing the plot
#==================

# copy the plot from screen to png device
dev.copy(
        png, # set the device
        "plot3.png", # set the filename
        width = 480, # set width
        height = 480 # set height
) 

dev.off() # close the device

rm(electric_consumption) # free memory
