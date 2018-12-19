  # download file from internet
  fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  
  # Download into R
  download.file(fileUrl, destfile = "getdata%2Fdata%2Fss06hid.csv")
 
  # Read file
  data <- read.table("getdata%2Fdata%2Fss06hid.csv", sep = ",", header = TRUE)
  #print(head(data))
  
  varNamesSplit <- strsplit(names(data), "wgtp")
  
  print(varNamesSplit[[123]])
  
  # result: 
  
  # ""   "15"
 