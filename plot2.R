install.packages("sqldf")
library(sqldf)

df = read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007', '2/2/2007')",header = TRUE, sep = ";")
summary(df)
head(df,5)

dfTemp = paste(df$Date, df$Time)
df$NewDateTime = strptime(dfTemp, "%d/%m/%Y %H:%M:%S")

plot(df$NewDateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()

