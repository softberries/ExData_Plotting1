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
png(filename="plot2.png")
plot(filteredData$DateTime, filteredData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()