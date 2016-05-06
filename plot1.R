setwd("C:/Users/Mike/Desktop/R_programming/Exploratory Data Analysis")
PowerConsump<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
PowerConsump<-PowerConsump[66600:107000, ]
head(PowerConsump)
str(PowerConsump)
PowerConsump$Date<-as.Date(PowerConsump$Date, format  ="%d/%m/%Y")
PowerConsump$Global_active_power<-as.numeric(PowerConsump$Global_active_power)
days2<-(subset(PowerConsump, PowerConsump >= "2007-02-16" & PowerConsump < "2007-02-18"))

png(file = "plot1.png")
hist(days2$Global_active_power, col ='red', main ="Global Active Power", xlab = "Global Active Power (kilowatts)" )
dev.off()
