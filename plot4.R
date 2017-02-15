#Unzip folder "ExData_Plotting1-master"
#Set this folder as the working directory using setwd()

#Read in data
HPCData <- read.csv("~/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

#Clean, format and subset data to relevant set
HPC<-HPCData
library(chron)
HPC$Date<-as.POSIXct(HPC$Date, format="%d/%m/%Y")
HPC$Date<-as.Date(HPC$Date)
HPC$Time<-chron(times=HPC$Time)
data<-subset(HPC, HPC$Date=="2007-02-01" | HPC$Date=="2007-02-02")
data$datetime <- with(data, paste(Date, Time))
data$datetime <- as.POSIXct(data$datetime)

#prepare data
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)


#create plot4 as png
png("plot4.png", width=480, height = 480, units = "px")
  #set 2x2 plot layout
par(mfcol=c(2,2))
  #plot4a
plot(data$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")
  #plot4b
plot(x=data$datetime, y=data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=data$datetime, y=data$Sub_metering_2, col="red")
lines(x=data$datetime, y=data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),fill=c("black","red", "blue"), cex=0.4)
  #plot4c
plot(x=data$datetime, y=data$Voltage, type ="l", xlab="datetime", ylab="Voltage")
  #plot4d
plot(x=data$datetime, y=data$Global_reactive_power, type ="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()