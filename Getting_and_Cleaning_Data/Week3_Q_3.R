  # download file from internet
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
 
  
   # Download into R
   gdp <-download.file(fileUrl, destfile = "getdata%2Fdata%2FGDP.csv")
   
   # read csv file
   gdp <-  read.csv("getdata%2Fdata%2FGDP.csv", TRUE,  "," )
   
   #print(head(gdp))
   
   # download file from internet
   fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
   
   # Download into R
    edu <- download.file(fileUrl1, destfile = "getdata%2Fdata%2FEDSTATS_Country.csv")
    
    # read csv file
    edu <-  read.csv("getdata%2Fdata%2FEDSTATS_Country.csv", TRUE,  "," )
    
   #print(head(edu))
    
   combined_file <- (merge(x = gdp, y = edu, by.x = 1, by.y = 1))
   #print(head(combined_file, 13))
   # sort(as.numeric(input_df[, column_name]))
   #  min(as.numeric(input_df[, column_name]), na.rm = TRUE)
   #   df <- df[order(df$"State", df[column_name], df$"Hospital.Name", na.last=NA),]
   cino <- combined_file[order(combined_file$"Gross.domestic.product.2012", na.last=NA),]
   print(names(cino))
   #print((combined_file$"Gross.domestic.product.2012"))
   # match <- sum(match(gdp$x, edu$CountryCode))
   #print(match)
   
