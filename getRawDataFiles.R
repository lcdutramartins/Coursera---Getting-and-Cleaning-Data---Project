getRawDataFiles <- function()
{
    ## it assures that the working directory contains all files needed to run data analysis
    
    rawDataFiles <- c(
        ".\\UCI HAR Dataset\\activity_labels.txt",
        ".\\UCI HAR Dataset\\features.txt",
        ".\\UCI HAR Dataset\\train\\subject_train.txt",
        ".\\UCI HAR Dataset\\train\\y_train.txt",
        ".\\UCI HAR Dataset\\train\\X_train.txt",
        ".\\UCI HAR Dataset\\test\\subject_test.txt",
        ".\\UCI HAR Dataset\\test\\y_test.txt",
        ".\\UCI HAR Dataset\\test\\X_test.txt")
    
    if (!all(file.exists(rawDataFiles, sep="")))
    {
        ## download zip file, if necessary
        zipFileName <- "UCI HAR Dataset.zip"
        if (!file.exists("UCI HAR Dataset.zip"))
        {
            zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            download.file(zipUrl, zipFileName)
        }
        
        zipRawDataFiles <- c(
            "UCI HAR Dataset/activity_labels.txt",
            "UCI HAR Dataset/features.txt",            
            "UCI HAR Dataset/train/subject_train.txt",
            "UCI HAR Dataset/train/y_train.txt",
            "UCI HAR Dataset/train/X_train.txt",
            "UCI HAR Dataset/test/subject_test.txt",
            "UCI HAR Dataset/test/y_test.txt",
            "UCI HAR Dataset/test/X_test.txt")
        
        ##extract 
        unzip(zipFileName, zipRawDataFiles, list=FALSE, overwrite=TRUE)
    }
    
    return(rawDataFiles)
}