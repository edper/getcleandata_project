getcleandata_project
==============
The objective of this project is to demonstrate the skills learned to collect and clean a dataset for "Getting and Cleaning Data" coursera.org course.

The project contain: 
	CodeBook.md describes variables, data transformation and how clean the dataset 
	README.md = breafly explanation of project 
	run_analysis.R = contain script file with R code


The run_analysis.R script does the following:
==============
### Basic steps
  0. Download and unpackage source dataset from [this url](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.   
  3. Uses descriptive activity names to name the activities in the data set  
  4. Appropriately labels the data set with descriptive variable names.   
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 ### Libraries used
   * dplyr
   * reshape2
  
 ### Functions
  * run_analysis <- main functions to run the analysis. If takes an option param = clean.data.
		if clean.data is true it will remove "data"" folder if exists and will redownload the entire dataset from [this url](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into .data folder.
		output: creates ./data/tidy_data.txt
		
  * get.X <- function to merge features variables from test and train set into one. It also sets the syntactically valid names from features file and select only mean and std features.
		returns a data.frame with clean feature dataset
		
  * get.y <- function to load, merge and clean lables data from test and train dataset
		returns a data.frame with clean labels
		
  * get.subject <- function to load and clean subjects from test and train dataset
		returns a data.frame with clean meerged subjects
		
  * get.sources <- function to download and unzip dataset source file from specified url into .data folder.
		url: url to download data from
		clean.data: boolean optional variable indicating to refresh existing dataset by deleting existing .data folder and redownload entire dataset
		returns: void
		
### How to use
	1. include run_analysis.R script with source("run_analysis.R")
	2. run run_analysis command with or without optional parameters
