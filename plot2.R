# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Question 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.

agg <- aggregate(Emissions ~ year, NEI, sum)

library(dplyr)

aggcity <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarize(Emissions = sum(Emissions))

Color <- 2:(length(agg$year)+1)

png("plot2.png")

with(aggcity,barplot(height=Emissions,col=Color, xlab="Year",ylab="Total PM2.5",main = "Total PM2.5 in Baltimore City, Maryland by Year", names.arg = year))

dev.off()
