# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Merge the Data 

MergedData <- merge(NEI, SCC, by = "SCC")

# Question 5

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

# Search for motor vehicle sources (ON-ROAD) in NEI

MotorVehicles <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

agg <- aggregate(Emissions ~ year,MotorVehicles, sum)


Color <- 2:(length(agg$year)+1)

png("plot5.png", width = 840, height = 480)

graph <- ggplot(agg, aes(factor(year), Emissions))
graph <- graph + geom_bar(stat = "identity", fill = Color) + xlab("year") + ylab("Total PM2.5") + labs(title="Total PM2.5 from Motor Vehicle Sources in Baltimore City from 1999 to 2008")
print(graph)
dev.off()

dev.off()

