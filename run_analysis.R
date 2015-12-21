library(plyr)
library(reshape2)

# Fetch the data if it isn't already downloaded
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFileName <- "FUCI_HAR_Dataset.zip"
if(!file.exists(zipFileName)){
      download.file(url, destfile = zipFileName, method = "libcurl")
}
unzip(zipFileName)

# Get data column names
features <- read.csv("UCI HAR Dataset/features.txt", sep = "", header = FALSE, colClasses = c("numeric", "character"))
colnames(features) <- c("id", "feature")
columnNames <- make.names(features[,"feature"])
# Load training data
X_trainData <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
colnames(X_trainData) <- columnNames
Y_trainData <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep = "", header = FALSE)
colnames(Y_trainData) <- c("activityid")
subject_trainData <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
colnames(subject_trainData) <- c("subject")
trainingData <- cbind(subject_trainData, Y_trainData, X_trainData)
# Load test data
X_testData <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
colnames(X_testData) <- columnNames
Y_testData <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep = "", header = FALSE)
colnames(Y_testData) <- c("activityid")
subject_testData <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
colnames(subject_testData) <- c("subject")
testData <- cbind(subject_testData, Y_testData, X_testData)
# Load activity labels
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE, colClasses = c("numeric", "character"))
colnames(activityLabels) <- c("activityid", "activity")

# Merge data together
mergedData <- rbind(trainingData, testData)
mergedDataWithLabels <- merge(mergedData, activityLabels, by = "activityid", all.x = TRUE)

# Filter out non mean or std columns
slimmedDown <- mergedDataWithLabels[ , grep("subject|activity$|mean[.][.]$|std[.][.]$", colnames(mergedDataWithLabels))]
slimmedDown$subject <- as.factor(slimmedDown$subject)
slimmedDown$activity <- as.factor(slimmedDown$activity)


# Aggregate for tidy data set
almostTidyDataSet <- ddply(slimmedDown, .(subject,activity), numcolwise(mean, na.rm = TRUE))

# Melt to make it narrow and tidy
tidyDataSet <- melt(almostTidyDataSet, id=1:2, measure=3:20)

# Write to file
write.table(tidyDataSet, file = "tidydataset.txt", row.names = FALSE)
