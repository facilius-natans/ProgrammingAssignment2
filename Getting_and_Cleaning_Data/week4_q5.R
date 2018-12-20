#library("quantmod")
  amzn <- getSymbols("AMZN", auto.assign = FALSE)
  #print(head(amzn))
  
  sampleTimes <-  index(amzn)
  #print(sampleTimes)
  
  
  all_values <- addmargins(table(year(sampleTimes), weekdays(sampleTimes)))
  print(all_values)

  #result:
  # Friday Monday Thursday Tuesday Wednesday  Sum
  # 2007     51     48       51      50        51  251
  # 2008     50     48       50      52        53  253
  # 2009     49     48       51      52        52  252
  # 2010     50     47       51      52        52  252
  # 2011     51     46       51      52        52  252
  # 2012     51     47       51      50        51  250
  # 2013     51     48       50      52        51  252
  # 2014     50     48       50      52        52  252
  # 2015     49     48       51      52        52  252
  # 2016     51     46       51      52        52  252
  # 2017     51     46       51      51        52  251
  # 2018     49     46       49      51        48  243
  # Sum     603    566      607     618       618 3012