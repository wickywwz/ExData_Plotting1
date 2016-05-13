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

##Make the plot
plot(hpcNew$timestamp,hpcNew$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Copy the graph to PNG file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png")