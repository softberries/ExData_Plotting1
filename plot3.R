##
## Read the data from downloaded file
##
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##
## Get the data for the two days only
##
filteredData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##
## Parse the date fields
##
filteredData$DateTime = strptime(paste(as.character(filteredData$Date), as.character(filteredData$Time)), "%d/%m/%Y %H:%M:%S")

##
## Generate the plot in png format
## default width and height are 480x480
##
png(filename="plot3.png")
plot(filteredData$DateTime, filteredData$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(filteredData$DateTime, filteredData$Sub_metering_2, type="l", col = "red")
lines(filteredData$DateTime, filteredData$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = names(filteredData)[7:9], col=c('black', 'red', 'blue'), lty=1)
dev.off()