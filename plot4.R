#-----------------------
# SET PAR
#-----------------------

par(mfcol = c(2,2)) # 2 rows x 2 columns, column-wise filling

#-----------------------
# PLOT 1 (TOP LEFT)
#-----------------------

# Type: Lines plot (bivariate).
# Main title = None
# Xlab = none
# Ylab = "Global Active Power (kilowatts)"
# Variable(s) = electric_consumption$Global_active_power, electric_consumption$Date

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
        labels = c("Thru", "Fri", "Sat")
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
        labels = c("Thru", "Fri", "Sat")
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
        labels = c("Thru", "Fri", "Sat")
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
        labels = c("Thru", "Fri", "Sat")
)

#-----------------------
# CREATE FILE
#-----------------------

dev.copy(png, "plot4.png") # copy the plot from screen to png device

dev.off() # close the device
