# Plot 1

# Type: histogram (univariate).
# Main title = "Global Active Power"
# Xlab = "Global Active Power (kilowatts)"
# Ylab = "Frequency"
# Variable(s) = electric_consumption$Global_active_power

hist(
        electric_consumption$Global_active_power, # Create a histogram from global_active_power variable
        col = "red", # Paint bins in red
        xlab = "Global Active Power (kilowatts)", # Add label to x axis
        ylab = "Frequency", # Add label to y axis
        main = "Global Active Power" # Add main title
)

dev.copy(png, "plot1.png") # copy the plot from screen to png device

dev.off() # close the device
