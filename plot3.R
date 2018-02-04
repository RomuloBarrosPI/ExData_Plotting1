# Plot 3

# Type: Lines plot (multivariate).
# Main title = "None"
# Xlab = none
# Ylab = "Energy sub metering"
# Variable(s) = Sub_metering_1, 2, and 3

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

axis(1,at = c(0,1440,2880),labels = c("Thru", "Fri", "Sat"))

lines(electric_consumption$Sub_metering_2, col = "red")

lines(electric_consumption$Sub_metering_3, col = "blue")

legend(
        "topright",
        
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

dev.copy(png, "plot3.png") # copy the plot from screen to png device

dev.off() # close device
