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

  # Plot 3
  with(feb_data, plot(Sub_metering_1 ~ date_time, type="l",
                    ylab = "Energy sub metering", xlab = ""))
  lines(feb_data$Sub_metering_2 ~ feb_data$date_time, col = "red")
  lines(feb_data$Sub_metering_3 ~ feb_data$date_time, col = "blue")
  legend("topright", lty=1, lwd =2, col=c("black","red","blue")
         ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  dev.copy(png, file="plot3.png",  width=480, height=480)
  dev.off()
