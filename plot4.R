install.packages("sqldf")
library(sqldf)


df = read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007', '2/2/2007')",header = TRUE, sep = ";")
summary(df)
head(df,5)

par(mfrow=c(2,2))
dfTemp = paste(df$Date, df$Time)
df$NewDateTime = strptime(dfTemp, "%d/%m/%Y %H:%M:%S")

plot(df$NewDateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(df$NewDateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(df$NewDateTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(df$NewDateTime, df$Sub_metering_2, type="l", xlab="", col="red")
points(df$NewDateTime, df$Sub_metering_3, type="l", xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n", cex=0.6) 
plot(df$NewDateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()
