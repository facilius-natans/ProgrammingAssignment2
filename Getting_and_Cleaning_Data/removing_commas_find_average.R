# Removed the s from https to be compatible with windows computers. 
# Skip first 5 rows and only read in relevent columns
  GDPrank <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                       , skip=5
                       , nrows=190
                       , select = c(1, 2, 4, 5)
                       , col.names=c("CountryCode", "Rank", "Country", "GDP" ))

  print(head(GDPrank))
  
  # Remove the commas using gsub.
  # Convert to integer after removing commas. 
  # Take mean of GDP column.
  
  GDP_no_commas <- GDPrank[, as.integer(gsub(pattern = ',', replacement = '', x = GDP))]
  print(head(GDP_no_commas))
  
  GDP_mean <- mean(GDP_no_commas)
  
  print(GDP_mean)

  # result:
  
  # CountryCode Rank        Country          GDP
  # 1:         USA    1  United States  16,244,600 
  # 2:         CHN    2          China   8,227,103 
  # 3:         JPN    3          Japan   5,959,718 
  # 4:         DEU    4        Germany   3,428,131 
  # 5:         FRA    5         France   2,612,878 
  # 6:         GBR    6 United Kingdom   2,471,784 
  # [1] 16244600  8227103  5959718  3428131  2612878  2471784
  # [1] 377652.4

