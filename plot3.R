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

#prepare plot3 data
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

#create plot3 as png
png("plot3.png", width=480, height = 480, units = "px")
plot(x=data$datetime, y=data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=data$datetime, y=data$Sub_metering_2, col="red")
lines(x=data$datetime, y=data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),fill=c("black","red", "blue"))
dev.off()