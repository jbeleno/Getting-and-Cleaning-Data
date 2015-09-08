# This method get the names of the features file and return it as a vector
getFeaturesNames <- function(){
    features_titles <- features <- read.table("./UCI HAR Dataset/features.txt")
    features_names <-  features[,2]
    features_names
}


# This method create a dataset with test data, using a cbind to get the subject,
# activities and features together and using getFeaturesNames method to set columns
# names, return the test dataset as a data frame
createTestDataSet <- function(){
    subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt', 
                               header=FALSE, col.names=c('id_subject'))
    activities_test <- read.table('./UCI HAR Dataset/test/y_test.txt', 
                                  header=FALSE, col.names=c('id_activity'))
    
    features_names <- getFeaturesNames()
    
    features_test <- read.table('./UCI HAR Dataset/test/X_test.txt', 
                                header=FALSE, col.names=features_names)
    
    testData <- cbind(subject_test, activities_test, features_test)
    testData
}

# This method create a dataset with train data, using a cbind to get the subject,
# activities and features together and using getFeaturesNames method to set columns
# names, return the train dataset as a data frame
createTrainDataSet <- function(){
    subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt', 
                                header=FALSE, col.names=c('id_subject'))
    activities_train <- read.table('./UCI HAR Dataset/train/y_train.txt', 
                                   header=FALSE, col.names=c('id_activity'))
    
    features_names <- getFeaturesNames()
    
    features_train <- read.table('./UCI HAR Dataset/train/X_train.txt', 
                                 header=FALSE, col.names=features_names)
    
    trainData <- cbind(subject_train, activities_train, features_train)
    trainData
}

# This method merge the train and test data using createTrainDataSet and 
# createTestDataSet methods to get each dataset and a rbind to merge them
# return the merged dataset as a data frame
createMergedDataSet <- function(){
    trainData <- createTrainDataSet()
    testData <- createTestDataSet()
    
    mergedData <- rbind(trainData, testData)
    mergedData
}

# This method takes the mergeData result and select only the features that match
# with std() or mean(), return the selected data as data frame
# Note: For some reason in Windows 7 the () are replaced by ..
selectMeanAndStdFeaturesInMergedDataSet <- function(){
    mergedData <- createMergedDataSet()
    selectedFeaturesIndexes <- grep("mean..|std..",names(mergedData))
    selectedColumns <- c(1,2, selectedFeaturesIndexes)
    selectedData <- mergedData[, selectedColumns]
    selectedData
}

# This method adds a new column with the descriptive values for activities instead
# of the numeric ones, return the correctly labeled dataset as a data frame
labelActivities <- function(){
    selectedData <- selectMeanAndStdFeaturesInMergedDataSet()
    activitites_titles <- read.table("./UCI HAR Dataset/activity_labels.txt",
                                     header=FALSE, 
                                     col.names=c('id_activity', 'activity'))
    activity <-  activitites_titles[selectedData[, 2],2]
    correctlyLabeledData <- cbind(selectedData,activity)
    correctlyLabeledData
}

# This method makes use of melt and dcast to get the mean of each variable for 
# subject and activity, it returns the tidy dataset as data frame
getTidyDataSet <- function(){
    library(reshape2)
    
    correctlyLabeledData <- labelActivities()
    meltedData <- melt(correctlyLabeledData,
                       id=c("id_subject","id_activity","activity"))
    tidyData <- dcast(meltedData,
                      id_subject + id_activity + activity ~ variable,
                      mean)
    tidyData
}

# This method takes the result of tidyData method and write it in a file to finish
# this project :)
run_analysis <- function(){
    tidyData <- getTidyDataSet()
    write.table(tidyData,"./tidyData.txt")
}

# The run_analysis is executed when the run_analysis.R file is loaded
# by using source("run_analysis.R")
run_analysis()