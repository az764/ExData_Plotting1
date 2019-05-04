##Data Prep

library(tidyverse)

setwd("U:/COURSERA/plot")

table<- read.table("household_power_consumption.txt",sep = ";",header=T,na.strings = "?")

table2<-table


table2$Time<- paste(table2$Date,table2$Time)

table2$Time<- as.POSIXct(table2$Time, format= "%d/%m/%Y %H:%M:%S")

table2$Date<- as.Date(table2$Date,format="%d/%m/%Y")

table2<- subset(table2,table2$Date>='2007-02-01' & table2$Date<='2007-02-02')

table2$Global_active_power<- as.numeric(table2$Global_active_power)

##Plot

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(table2$Time,table2$Global_active_power,type='l',main='',ylab = 'Global Active Power (kilowats)',xlab='')

plot(table2$Time,table2$Voltage,type='l',xlab="datetime",ylab="Voltage")

plot(table2$Time,table2$Sub_metering_1,col="black",type='l',ylab="Energy sub metering",xlab='')
lines(table2$Time, table2$Sub_metering_2,col="red")
lines(table2$Time,table2$Sub_metering_3, col= "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), cex = 0.6,bty = 'n')

plot(table2$Time,table2$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")

dev.off()