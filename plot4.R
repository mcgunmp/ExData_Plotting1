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

png(file="plot4.png")
par(mfcol = c(2,2), mar=c(4,4,4,4))
plot(days2$date2, days2$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")


plot(days2$date2, days2$Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = "")
lines(days2$date2, days2$Sub_metering_1)
lines(days2$date2, days2$Sub_metering_2, col= 'red')
lines(days2$date2, days2$Sub_metering_3, col='blue')
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = c(1,1,1),bty='n',cex= .75,col = c("black", "red","blue"))

plot(days2$date2, days2$Voltage, type = 'l', xlab='datetime', ylab='voltage')

plot(days2$date2, days2$Global_reactive_power, type='l', xlab='datetime', ylab = 'Global reactive Power')
dev.off()