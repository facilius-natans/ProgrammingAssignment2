setwd("C:/Users/natpo/Desktop/coursera/ProgrammingAssignments/Exploratory_Analysis/Project1")

# Reads in data from file 
all_data <- data.table::fread(input = "household_power_consumption.txt"
                              , na.strings="?"
)

# Subsets data for specified dates
feb_data <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))

feb_data$Date <- as.Date(feb_data$Date, format="%d/%m/%Y")
hist(feb_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file ="plot1.png", width=480, height=480)
dev.off()