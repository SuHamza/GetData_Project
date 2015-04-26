tidyData <- function() {
  #Set Working Directory
  #Please Change the directory to where the Samsung data is located
  setwd("../Project_GetData/UCI HAR Dataset")
  #Read Train data & Labels
  train <- read.table("train/X_train.txt")
  trainLbl <- read.table("train/y_train.txt")
  
  #Read Test data
  test <- read.table("test/X_test.txt")
  #Read Test Labels
  testLbl <- read.table("test/y_test.txt")
  #Combine Train & Test Labels
  Lbl <- rbind(trainLbl, testLbl)
  
  #Read Features
  feat <- read.table("features.txt")
  #Merge Training and Test sets into one data set
  dat <- rbind(train, test)
  #Get Column Numbers for Mean & Standard Deviation
  col_m <- grep(("mean\\(\\)"), feat$V2)
  col_s <- grep(("std\\(\\)"), feat$V2)
  col <- c(col_m, col_s)
  #Extract only the measurements on the mean and standard deviation for each measurement
  data <- dat[,col]
  
  #Combine Activity Labels with Data set
  data <- cbind(data, Lbl)
  
  #Appropriately label the data set with descriptive variable names
  colnames(data) <- c(as.character(feat[col,2]),"Activity")
  
  #Use descriptive activity names to name the activities in the data set
  data$Activity[data$Activity == "1"] <- "WALKING"
  data$Activity[data$Activity == "2"] <- "WALKING_UPSTAIRS"
  data$Activity[data$Activity == "3"] <- "WALKING_DOWNSTAIRS"
  data$Activity[data$Activity == "4"] <- "SITTING"
  data$Activity[data$Activity == "5"] <- "STANDING"
  data$Activity[data$Activity == "6"] <- "LAYING"
  
  #Read Subject_train data
  s1 <- read.table("train/subject_train.txt")
  #Read Subject_test data
  s2 <- read.table("test/subject_test.txt")
  #combine Subject data
  subj <- rbind(s1,s2)
  colnames(subj) <- "Subject"
  #Merge Subject column with data
  newData <- cbind(data,subj)
  #Create a second, independent tidy data set 
  #with the average of each variable for each activity and each subject
  library(dplyr) #Package "dplyr" should be already installed
  gData <- group_by(newData, Activity,Subject)
  avgData <- summarise_each(gData, funs(mean))
  
  #Write Average Data set to file
  write.table(avgData, file = "tidyData.txt", row.name=FALSE)
  
}
