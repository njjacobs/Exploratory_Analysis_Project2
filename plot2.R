# Exploratory Data Analysis Week 4 Course Project 2  

# Assuming files are in working directory 

# Read each of the two files using readRDS()

# This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Question 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.

aggcity <- aggregate(Emissions ~ year, city, sum)

png("plot2.png")

barplot(height=aggcity$Emissions,xlab="Year",ylab="Total PM25",main = "Total PM25 in Baltimore City, Maryland by Year", names.arg = aggcity$year)

dev.off()

