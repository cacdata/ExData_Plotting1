parTheColumns <- c("character","character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric" )
p1 <- read.table("household_power_consumption.txt", header=TRUE, sep= ";",  na.strings ="?", colClasses=TheColumns)
p2 <- mutate (p1,DateTime = paste(p1$Date, p1$Time, sep = " "))
p2$DateTime <- strptime(p2$DateTime,"%d/%m/%Y %H:%M:%S")
#p1$Date <- as.Date(p1$Date, format="%d/%m/%Y") 
StartDate <- strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S") 
StopDate <- strptime("2007-02-03 00:00:00","%Y-%m-%d %H:%M:%S")
subP1 <- p2[p2$DateTime >= StartDate & p2$DateTime < StopDate & !(is.na(p2$DateTime)),]



#4
with(subP1, plot(DateTime,Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime"))
with(subP1, lines(DateTime,Global_reactive_power))

dev.off()