  # download file from internet
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  
  # Download into R
  download.file(fileUrl, destfile = "getdata%2Fdata%2Fss06hid.csv")
  
  # Read file
  data <- read.table("getdata%2Fdata%2Fss06hid.csv")
 
  
  data <- read.table("getdata%2Fdata%2Fss06hid.csv", sep = ",", header = TRUE)
  #print(head( data))
  
  # Record the date and time
  dateDownLoaded <- date()
  dateDownLoaded
  print(dateDownLoaded)
  
  agricultureLogical <- data[which(data$ACR == 3 & data$AGS == 6), ]
  print (agricultureLogical)
  
 
 
  
  
  
 
                   
  
  
