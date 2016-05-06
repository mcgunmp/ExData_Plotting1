setwd("C:/Users/Mike/Desktop/R_programming/Exploratory Data Analysis")
PowerConsump<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
PowerConsump<-PowerConsump[66600:107000, ]
head(PowerConsump)
str(PowerConsump)
PowerConsump$Date<-as.Date(PowerConsump$Date, format  ="%d/%m/%Y")
PowerConsump$Global_active_power<-as.numeric(PowerConsump$Global_active_power)
x<-paste(PowerConsump$Date, PowerConsump$Time)
PowerConsump$date2<-(as.POSIXlt(x, "%Y/%m/%d %H:%M:%S"))
days2<-(subset(PowerConsump, PowerConsump >= "2007-02-01" & PowerConsump < "2007-02-3"))

png(file = "plot2.png")
plot(days2$date2, days2$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
