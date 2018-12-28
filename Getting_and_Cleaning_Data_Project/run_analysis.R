  
  # install.packages("dplyr")
  # install.packages("data.table")
  # Load packages
  # library(data.table)
  # library(dplyr)

  # download UCI files into R
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  data <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if (!file.exists(data)){
   download.file(fileURL, destfile = data)
  }
  if(file.exists("./UCI_HAR_Dataset")){
      unzip(data)
  }
  dateDownloaded <- date()
  
  # Read features names for both test and train features files
  features_names <- read.table(("./features.txt"), as.is = TRUE)
  
  # read Activity Labels
  activities <- read.table("./activity_labels.txt")
  colnames(activities) <- c("activity", "activity_type")
  
  # Read Test files
  featuresTest <- read.table("./test/X_test.txt")
  subjectTest <- read.table("./test/subject_test.txt")
  activityTest <- read.table("./test/y_test.txt")
  
  # Combine all test files into one df using "cbind"
  test <- cbind(subjectTest, activityTest, featuresTest)
  
  # Read Train files
  featuresTrain <- read.table("./train/X_train.txt")
  subjectTrain <- read.table("./train/subject_train.txt")
  activityTrain <- read.table("./train/y_train.txt")
  
  # Combine all train files into one df using "cbind"
  train <- cbind(subjectTrain, activityTrain, featuresTrain)
  
  
  # Step 1
  # Merge test and train datasets using "rbind"
  merged_df <- rbind(test, train)
  
  # Change all variables names
  colnames(merged_df) <- c("subject", features_names$V2, "activity")
  
  # Step 2 
  # Extract only the measurements on the mean and standard deviation for each measurement.
  selected_columns <- grepl("subject|activity|mean|std", colnames(merged_df))
  final_df <- merged_df[, selected_columns]
  
  
  # Step 3 - Use descriptive activity names to name the activities in the data set
  #  replace activity values with named factor levels
  final_df$activity <- factor(final_df$activity, 
      levels = activities[, 1], labels = activities[, 2])
  
  # print(final_df)
  
  # Step 4 - Appropriately label the data set with descriptive variable names
  # get column names
  
  merged_df_col <- colnames(final_df)
  
  # remove special characters
  merged_df_col <- gsub("[\\(\\)-]", "", merged_df_col)
  
  # rename columns with clear understandable names
  
  merged_df_col <- gsub("^t", "time", merged_df_col)
  merged_df_col <- gsub("Acc", "Accelerometer", merged_df_col)
  merged_df_col <- gsub("Gyro", "Gyroscope", merged_df_col)
  merged_df_col <- gsub("Mag", "Magnitude", merged_df_col)
  merged_df_col <- gsub("Freq", "Frequency", merged_df_col)
  merged_df_col <- gsub("BodyBody", "Body", merged_df_col)
  
  # use new labels as column names
  colnames(final_df) <- merged_df_col
  
  # Step 5 - Create a second, independent tidy set with the average of each
  #          variable for each activity and each subject
  
  # group by subject and activity and summarise using mean
  
  final_df_means <- final_df  %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
  
  # create file "tidy_dataset.txt"
   write.table(final_df_means, "tidy_dataset.txt", row.names = FALSE, quote = FALSE)
   tidy_dataset <- read.table("tidy_dataset.txt", header=TRUE)
    print(tidy_dataset)
 
                  
  
  
  
  
  
  
  