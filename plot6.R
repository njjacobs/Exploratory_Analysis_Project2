# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Merge the Data 

MergedData <- merge(NEI, SCC, by = "SCC")

# Question 6

# Compare emissions from motor vehicle sources
# in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California 
# (fips == 06037). Which city has seen greater 
# changes over time in motor vehicle emissions?



library(ggplot2)

# Search for motor vehicle sources (ON-ROAD) in NEI

MotorVehicles <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",]

agg <- aggregate(Emissions ~ year + fips,MotorVehicles, sum)
agg$fips[agg$fips=="24510"] <- "Baltimore City"
agg$fips[agg$fips=="06037"] <- "Los Angeles"

Color <- 2:(length(agg$year)+1)

png("plot6.png", width = 1040, height = 480)

graph <- ggplot(agg, aes(factor(year), Emissions))
graph <- graph + facet_grid(.~fips)
graph <- graph + geom_bar(stat = "identity", fill = Color) + xlab("year") + ylab("Total PM2.5") + labs(title="Total PM2.5 from Motor Vehicle Sources in Baltimore City vs Los Angeles from 1999 to 2008")

print(graph)
dev.off()

