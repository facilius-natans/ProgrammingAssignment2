
# download file from internet
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# Download into R
  download.file(fileUrl, destfile = "./getdata%2Fdata%2Fss06hid.csv")
  
  # Record the date and time
  dateDownLoaded <- date()
  dateDownLoaded
  
  # Read file
  data <- read.table("getdata%2Fdata%2Fss06hid.csv")
  head(data)
  
  # Read in a readable way
  data <- read.table("getdata%2Fdata%2Fss06hid.csv", sep = ",", header = TRUE)
  head(data)
  
  # Class of the file
  class(data)
  
  # Get required column
  my_data <- data[ , "VAL"]
  print(head(my_data))
  
  # Remove "NA"s
  
  
  
  