# Plot 2

# Type: Lines plot (bivariate).
# Main title = "Global Active Power"
# Xlab = none
# Ylab = "Global Active Power (kilowatts)"
# Variable(s) = electric_consumption$Global_active_power, electric_consumption$Date

with(electric_consumption, 
     plot(
             Global_active_power,
             type = "l",
             main = "Global Active Power",
             xlab = "",
             ylab = "Global Active Power (kilowatts)",
             xaxt = "n"
     ) 
)

axis(1,at = c(0,1440,2880),labels = c("Thru", "Fri", "Sat"))

dev.copy(png, "plot2.png") # copy the plot from screen to png device

dev.off() # close the device
