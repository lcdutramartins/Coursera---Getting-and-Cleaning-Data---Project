## loading all source code needed to run data analysis
# source("getRawDataFiles.R")

## getting all necessary files
# rawDataFilePaths <- getRawDataFiles()

## metadata
Activities <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
Features <- read.table(".\\UCI HAR Dataset\\features.txt")
FeaturesIndexes <- sort(c(grep("mean\\(\\)", Features$V2), grep("std\\(\\)", Features$V2))) #only mean and std variables

## train data
TrainSubjects <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
TrainLabelIDs <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
TrainActivity <- apply(TrainLabelIDs, MARGIN=1, FUN=function(elt) { Activities[which(Activities$V1 == elt), 2] })
TrainFeatures <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
TrainData <- cbind("Train", TrainSubjects, TrainLabelIDs, TrainActivity, TrainFeatures[,FeaturesIndexes])

## test data
TestSubjects <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
TestLabelIDs <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
TestActivity <- apply(TestLabelIDs, MARGIN=1, FUN=function(elt) { Activities[which(Activities$V1 == elt), 2] })
TestFeatures <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
TestData <- cbind("Test", TestSubjects, TestLabelIDs, TestActivity, TestFeatures[,FeaturesIndexes])

## generating clean data set
resultNames <- c("Type", "Subject", "ActivityId", "Activity", as.character(Features[FeaturesIndexes,2]))
names(TrainData) <- resultNames
names(TestData) <- resultNames
result <- rbind(TrainData, TestData)
