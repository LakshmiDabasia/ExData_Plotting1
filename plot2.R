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

#prepare plot2 data
data<-data[!is.na(data["Global_active_power"]),]

#create plot2 as png
png("plot2.png", width=480, height = 480, units = "px")
plot(x=data$datetime, y=data$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()