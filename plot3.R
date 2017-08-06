library(dplyr)

hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?",
                  colClasses=c("character","character","numeric","numeric",
                               "numeric","numeric","numeric","numeric",
                               "numeric"), header=TRUE)
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc <- mutate(hpc, date.time = as.POSIXct(paste(Date, Time), 
                                          "%d/%m/%Y %H:%M:%S", tz="GMT"))
png(filename="plot3.png")
with(hpc, plot(date.time, Sub_metering_1, type="n", xlab="",
               ylab="Energy sub metering"))
with(hpc, points(date.time, Sub_metering_1, type="l", col="grey", lwd=2))
with(hpc, points(date.time, Sub_metering_2, type="l", col="red", lwd=2))
with(hpc, points(date.time, Sub_metering_3, type="l", col="blue", lwd=2))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("grey","red","blue"),lwd=2)
dev.off()