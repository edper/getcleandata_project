#include dplyr library
library(dplyr)
library(reshape2)

#main function for data analysis
# params: 
#  clean.data typeof BOOL for cleaning existing file and redownload sources
run_analysis <- function(clean.data = FALSE) {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    #getting source file
    get.sources(url, clean.data)
    
    dataset <- cbind(get.X(), get.y(), get.subject())
    
    #Compute the mean grouped by subject/lables
    dataset.melt <- melt(dataset, id.var = c("subject", "activity"))
    result <- dcast(dataset.melt, subject + activity ~ variable, mean)
    write.table(result, file = "./data/tidy_data.txt", row.names=FALSE)
    result
}


# load and clean features
get.X <- function() {
    message("Getting X ... ")
    test.x <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    train.x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    features <- read.table("./data/UCI HAR Dataset/features.txt")
    
    x <- rbind(test.x, train.x)
    #make syntactically valid names
    names(x) <- make.names(names = features[, 2], unique = T, allow_ = T)
    
    #extract only mean and std measurements
    filtered.x <- select(x, matches("(mean|std)"))
    filtered.x
}

#load and clean activity labels
get.y <- function(){
    message("Getting activities ...")
    test.y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    train.y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
    y <- rbind(test.y, train.y)
    y[,1]=labels[y[,1],2]
    names(y) <- "activity"
    y
}

#load and clean subjects
get.subject <- function() {
    message("Getting subjects ...")
    test.subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    train.subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    subject <- rbind(test.subject, train.subject)
    names(subject) <- "subject"
    subject
}

# 1. this function downloads the  source file from specified url into data folder
#  if clean.data is TRUE it will redownload the file even the file already exists
# 2. Extract files from archive
get.sources <- function(url, clean.data) {
    
    #if force is True remove data folder in order to renew them
    if (clean.data)
    {
        unlink("./data", recursive = T)
    }
    
    #create data folder to store all working files
    if (!file.exists("data"))    
        dir.create("data")
    
    # download file from url if needed
    if (!file.exists("./data/dataset.zip"))
    {
        message(paste("downloading file from url:", url, " ... "))
        download.file(url, "./data/dataset.zip", quiet = T)
        message("file downloaded")
    }
    
    #unzip archive if neened
    if (file.exists("./data/dataset.zip") && !file.exists("./data/UCI HAR Dataset"))
    {
        message("Unziping dataset.zip ...")
        unzip("./data/dataset.zip", exdir = "./data")
        message("Unzip done!")
    }
    
    message("raw data are here :)")
}