#Pre-Processing

setwd('~/data')

url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if (!file.exists('data/exdata-data-household_power_consumption_data.zip')) {
  download.file(url, 'data/exdata-data-household_power_consumption_data.zip')
  unzip('data/exdata-data-household_power_consumption_data.zip', exdir='./data')
}

data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

data$Voltage <- as.numeric(as.character(data$Voltage))

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))

data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

dataSubset <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

dataSubset <- transform(dataSubset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Plot3

png('plot3.png', width = 480, height = 480)

plot(dataSubset$timestamp,dataSubset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataSubset$timestamp,dataSubset$Sub_metering_2,col="red")
lines(dataSubset$timestamp,dataSubset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()