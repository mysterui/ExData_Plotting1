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

dataSubset <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]


#Plot1

png('plot1.png', width = 480, height = 480)

hist(dataSubset$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

dev.off()
