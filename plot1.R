install.packages("sqldf")
library(sqldf)
setwd("D:/LDP/00 - Updated-Folder/Personal/Big Data/Coursera - Explorartory")

df = read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007', '2/2/2007')",header = TRUE, sep = ";")
summary(df)
head(df,5)

hist(df$Global_active_power,
      col = "red",
      main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
