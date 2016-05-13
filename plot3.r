##Load dataset in current working directory
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

##Convert the Date column to Date class
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

##Convert the Global_active_power column to Numeric class
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))

##Get the subset of data we want to plot
hpc1 <- subset(hpc,Date=='2007-02-01')
hpc2 <- subset(hpc,Date=='2007-02-02')
hpcNew<-rbind(hpc1,hpc2)
hpcNew <- transform(hpcNew, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
hpcNew$Sub_metering_1 <- as.numeric(as.character(hpcNew$Sub_metering_1))
hpcNew$Sub_metering_2 <- as.numeric(as.character(hpcNew$Sub_metering_2))
hpcNew$Sub_metering_3 <- as.numeric(as.character(hpcNew$Sub_metering_3))

##Make the plot
plot(hpcNew$timestamp,hpcNew$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpcNew$timestamp,hpcNew$Sub_metering_2,col="red")
lines(hpcNew$timestamp,hpcNew$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  
##Copy the graph to PNG file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png")