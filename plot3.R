parTheColumns <- c("character","character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric" )
p1 <- read.table("household_power_consumption.txt", header=TRUE, sep= ";",  na.strings ="?", colClasses=TheColumns)
p2 <- mutate (p1,DateTime = paste(p1$Date, p1$Time, sep = " "))
p2$DateTime <- strptime(p2$DateTime,"%d/%m/%Y %H:%M:%S")
#p1$Date <- as.Date(p1$Date, format="%d/%m/%Y") 
StartDate <- strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S") 
StopDate <- strptime("2007-02-03 00:00:00","%Y-%m-%d %H:%M:%S")
subP1 <- p2[p2$DateTime >= StartDate & p2$DateTime < StopDate & !(is.na(p2$DateTime)),]



## plot 3
png("plot3.png")
with(subP1, plot(DateTime,Sub_metering_1, type="n", ylab="Energy sub metering",xlab=""))
with(subP1, lines(DateTime,Sub_metering_1, col="Black"))
with(subP1, lines(DateTime,Sub_metering_2, col="Red"))
with(subP1, lines(DateTime,Sub_metering_3, col="Blue"))
with(subP1,legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
     lty=c(1,1,1),
     lwd= c(1.0,1.0,1.0),col = c("black","blue","red")))
dev.off()

