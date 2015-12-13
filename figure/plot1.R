load_elec <- function() {
	d_1 <- read.table("household_power_consumption.txt", header=T, sep=";", na='?')
	d_2 <- subset(d_1, Date == '1/2/2007' | Date == '2/2/2007')
	d_1 <- NA
	data <- transform(d_2, Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
	return(data)
}

plot1 <- function() {
    data <- load_elec()
    png("plot1.png", width=480, height=480)
    
    hist(data$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         col="red")
    
    dev.off()
}