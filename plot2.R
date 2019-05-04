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

png("plot2.png", width = 480, height=480)

plot(table2$Time,table2$Global_active_power,type='l',main='',ylab = 'Global Active Power (kilowats)',xlab='')

dev.off()

