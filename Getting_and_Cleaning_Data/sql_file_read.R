  # download file from internet
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  
  # Download into R
  download.file(fileUrl, destfile = "./getdata%2Fdata%2Fss06hid.csv")
  
  # Record the date and time
  dateDownLoaded <- date()
  dateDownLoaded
  
  # Read file
  data <- read.table("getdata%2Fdata%2Fss06hid.csv")
  head(data)
  # print(head(data))
  
  # Read in a readable way
  data <- read.table("getdata%2Fdata%2Fss06hid.csv", sep = ",", header = TRUE)
  head(data)
  
  acs <- data
  # print(head(acs))
  
  result <- sqldf("select pwgtp1 from acs where AGEP < 50")
  print(head(result))
  
  result1 <- sqldf("select distinct AGEP from acs")
  print(head(result1))