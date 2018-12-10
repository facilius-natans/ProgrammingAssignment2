  # download file from internet
  #fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
 
  
   # Download into R
   #gdp <-download.file(fileUrl, destfile = "getdata%2Fdata%2FGDP.csv")
   
   # read csv file
   gdp <-  read.csv("getdata_data_GDP.csv", TRUE,  "," )
   
   # print(head(gdp))
   
   
   # download file from internet
   fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
   
   # Download into R
    edu <- download.file(fileUrl1, destfile = "getdata%2Fdata%2FEDSTATS_Country.csv")
    
    # read csv file
    edu <-  read.csv("getdata%2Fdata%2FEDSTATS_Country.csv", TRUE,  "," )
    
   #print(head(edu))
    
   combined_df <- (merge(x = gdp, y = edu, by.x = 1, by.y = 1))
   #print(head(combined_df, 13))
  
   df <- combined_df[1:190, c("CountryCode", "Ranking", "millions.of.US.dollars", "Income.Group")]
   #print(head(df))
   
   df$CountryCode <-  as.character(df$CountryCode)
   
   df$Ranking <- as.numeric(df$Ranking)
   
   df$"millions.of.US.dollars" <- as.numeric(df$"millions.of.US.dollars")
   
   #str(df)
   
  
   
   df_sorted <- df[order(df$Ranking, decreasing = TRUE, na.last=TRUE), ]
   #df_sorted <- df[order(df$Ranking), ]
   #print(tail(df_sorted, 13))
   
   
   #av_gtp <-tapply(df$Ranking, df$"Income.Group", ave)
   gr <- group_by(df,df$"Income.Group")
   av_gr <- summarise(gr, mean(Ranking, na.rm = TRUE ))
   
   #print(av_gr)
   
   quan_gr <- quantile(df$Ranking, na.rm = TRUE)
   #print(quan_gr)
   
   table_with_quan <- within(df, as.integer(cut(df$Ranking, quantile(df$Ranking), na.rm = TRUE)))
 
   print(table_with_quan)
