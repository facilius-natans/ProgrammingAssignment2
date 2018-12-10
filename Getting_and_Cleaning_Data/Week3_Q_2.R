  # download file from internet
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  
  download.file(fileUrl, destfile = "getdata%2Fjeff.jpg")
  
  test<-readJPEG("getdata%2Fjeff.jpg")
  print(test(head))
 

