  setwd("C:/Users/natpo/Desktop/coursera/ProgrammingAssignments/Exploratory_Analysis/Project1")

  # Reads in data from file 
  all_data <- data.table::fread(input = "household_power_consumption.txt"
                              , na.strings="?"
  )

  # Subsets data for specified dates
  feb_data <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))

  feb_data$Date <- as.Date(feb_data$Date, format="%d/%m/%Y")

  date_time <- paste(as.Date(feb_data$Date), feb_data$Time)
  feb_data$date_time <- as.POSIXct(date_time)

  ## Plot 2
  with(feb_data, plot(Global_active_power ~ date_time, type="l",
       ylab="Global Active Power (kilowatts)", xlab=""))
  dev.copy(png, file="plot2.png",  width=480, height=480)
  dev.off()
  