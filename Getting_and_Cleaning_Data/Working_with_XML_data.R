  # use "XML" package
  library("XML")
  
  # Download file from Internet
  fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  
  # Read file
  doc <- xmlParse(fileUrl)
  
  # Transform xml file into dataframe
  a <- xmlToDataFrame(getNodeSet(doc,"//response/row/row"))
  print(head(a))
  
  # Extract all rows with column "zipcode"
  rest_with_desired_zipcode <- data.frame(a, a$zipcode)
  print(rest_with_desired_zipcode)
  
  # Get the number of restaurants with particular zipcode
  num_of_rest_with_desired_zipcode <- sum( a$zipcode == 21231)
  b <- num_of_rest_with_desired_zipcode
  print(b)
 

