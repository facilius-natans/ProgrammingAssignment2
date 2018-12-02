
  # use "xlsx" package
<<<<<<< HEAD
   library("xlsx")
=======
  library("xlsx")
  library("rJava")
>>>>>>> aa87736a1b2e2b88416047022540195c874ccea4

  # Download excel file fro Internet
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileUrl, destfile = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx")
              
  # Record date and time
  dateDownloaded <- date()
  print(dateDownloaded)

  # Read file
<<<<<<< HEAD
  # file <- read.xlsx("getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, header = TRUE)
  #print(head(file))

  # Extract 18-23 rows and 7-15 columns
  rowIndex <- 18:23
  colIndx <- 7:15
  dat <- read.xlsx(file="getdata%2Fdata%2FDATA.gov_NGAP.xlsx",sheetIndex=1,colIndex=colIndx,startRow=18, endRow=23, header=TRUE)
  print(head(dat))
  #dat <- file[18:23, 7:15]
  # print(head(dat))

=======
  
  rowIndex <- 18:23
  colIndx <- 7:15
  dat <- read.xlsx("getdata%2Fdata%2FDATA.gov_NGAP.xlsx",sheetIndex = 1,colIndex = colIndx,startRow = 18, endRow = 23, header=TRUE)
  print(head(dat))
  
>>>>>>> aa87736a1b2e2b88416047022540195c874ccea4
  # get result from expression:
  a <- sum(dat$Zip*dat$Ext, na.rm = T)
   print(a)