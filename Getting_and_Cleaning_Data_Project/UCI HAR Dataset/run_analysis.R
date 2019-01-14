  
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
  featuresNames <- read.table(("./features.txt"), header = F)
  
  # read Activity Labels
  activityLabels <- read.table("./activity_labels.txt", header = F)
  
  # Read Test files
  featuresTest <- read.table("./test/X_test.txt", header = F)
  subjectTest <- read.table("./test/subject_test.txt", header = F)
  activityTest <- read.table("./test/y_test.txt",header = F)
  
  # Read Train files
  featuresTrain <- read.table("./train/X_train.txt", header = F)
  subjectTrain <- read.table("./train/subject_train.txt", header = F)
  activityTrain <- read.table("./train/y_train.txt", header = F)
  
  # Merge df using "rbind"
  featuresData <- rbind(featuresTest, featuresTrain)
  subjectData <- rbind(subjectTest, subjectTrain)
  activityData <- rbind(activityTest, activityTrain)
  
  # Rename columns in ctivityData & activityLabels df
  names(activityData) <- "ActivityN"
  names(activityLabels) <- c("ActivityN", "Activity")
  
  # Get factor of Activity names
  Activity <- left_join(activityData, activityLabels, "ActivityN")[, 2]
  
  # Rename subjectData columns
  names(subjectData) <- "Subject"
  # Rename FeaturesData columns using columns from featuresNames
  names(featuresData) <- featuresNames$V2
  
  # Create one large dataset with only these variables: subjectData,  Activity,  featuresData
  dataSet <- cbind(subjectData, Activity)
  dataSet <- cbind(dataSet, featuresData)
  
  # Extract only the measurements on the mean and standard deviation for each measurement.
  subFeaturesNames <- featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]
  dataNames <- c("Subject", "Activity", as.character(subFeaturesNames))
  dataSet <- subset(dataSet, select=dataNames)
  
  #Rename the columns of the large dataset using more descriptive activity names
  names(dataSet)<-gsub("^t", "time", names(dataSet))
  names(dataSet)<-gsub("^f", "frequency", names(dataSet))
  names(dataSet)<-gsub("Acc", "Accelerometer", names(dataSet))
  names(dataSet)<-gsub("Gyro", "Gyroscope", names(dataSet))
  names(dataSet)<-gsub("Mag", "Magnitude", names(dataSet))
  names(dataSet)<-gsub("BodyBody", "Body", names(dataSet))
  
  # Create a second, independent tidy set with the average of each
  #          variable for each activity and each subject
  
  # group by subject and activity and summarise using mean
  
  secondDataSet<-aggregate(. ~Subject + Activity, dataSet, mean)
  secondDataSet<-secondDataSet[order(secondDataSet$Subject,secondDataSet$Activity),]
  
  # create file "tidy_dataset.txt"
   write.table(secondDataSet, file = "tidy_dataset.txt", row.name = FALSE)
  tidy_dataset <- read.table("tidy_dataset.txt", header=TRUE)
    
 
   
                  
  
  
  
  
  
  
  