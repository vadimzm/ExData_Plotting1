load_elec <- function() {
	d_1 <- read.table("household_power_consumption.txt", header=T, sep=";", na='?')
	d_2 <- subset(d_1, Date == '1/2/2007' | Date == '2/2/2007')
	d_1 <- NA
	data <- transform(d_2, Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
	return(data)
}

plot4 <- function() {
    data <- load_elec()
    png("plot4.png", width=480, height=480)
    
    par(mfrow=c(2,2))
    
    plot(data$Time, 
      data$Global_active_power,
      type="l",
	    xlab="",
	    ylab="Global active power"
    )
    
    plot(data$Time, 
         data$Voltage,
         type="l",
         xlab="datatime",
         ylab="Voltage"
    )
    
    plot(data$Time, 
         data$Sub_metering_1,
         type="l",
         xlab="",
         ylab="Energy sub metering"
    )

    lines(data$Time, data$Sub_metering_2, col="red")
    lines(data$Time, data$Sub_metering_3, col="blue")
    
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
           lty=1,
           bty="n")

    plot(data$Time, 
         data$Global_reactive_power,
         type="l",
         xlab="datatime",
         ylab="Global_reactive_power"
    )

    dev.off()
}