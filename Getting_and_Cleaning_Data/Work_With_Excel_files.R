
  # use "xlsx" package
  library("xlsx")
  library("rJava")

  # Download excel file fro Internet
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileUrl, destfile = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx")
              
  # Record date and time
  dateDownloaded <- date()
  print(dateDownloaded)

  # Read file
  
  rowIndex <- 18:23
  colIndx <- 7:15
  dat <- read.xlsx("getdata%2Fdata%2FDATA.gov_NGAP.xlsx",sheetIndex = 1,colIndex = colIndx,startRow = 18, endRow = 23, header=TRUE)
  print(head(dat))
  
  # get result from expression:
  a <- sum(dat$Zip*dat$Ext, na.rm = T)
   print(a)