# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Merge the Data 

MergedData <- merge(NEI, SCC, by = "SCC")

# Question 5

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(dplyr)

# Search for motor vehicle sources (ON-ROAD) in NEI

OnRoadSubset <- NEI %>% filter(fips=="24510") %>% group_by(year) %>% summarize(Emissions = sum(Emissions))

Color <- 2:(length(agg$year)+1)

png("plot5.png")

with(OnRoadSubset, barplot(height = Emissions, col = Color, xlab="Year", ylab="Total PM2.5", names.arg = year, main = "Total PM2.5 for Motor Vehicles in Baltimore from 1999 to 2008"))

dev.off()

