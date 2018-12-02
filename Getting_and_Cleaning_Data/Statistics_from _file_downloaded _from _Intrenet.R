  library(data.table)

 # Download file
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  dt <- fread(fileUrl)
  #print(head(dt))
  DT <- dt
  a <- rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
  # print(a)
  b <- mean(DT$pwgtp15,by=DT$SEX)
   print(b)
  c <- tapply(DT$pwgtp15,DT$SEX,mean)
  # print(c)
  d <- mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
  # print(d)
  e <- DT[,mean(pwgtp15),by=SEX]
  # print(e)
  # f <- sapply(split(DT$pwgtp15,DT$SEX),mean)
  print(f)
