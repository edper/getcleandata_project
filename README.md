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
  1. Merges the training and the test sets to create one dataset 
  2. Extracts only the measurements on the mean and standard deviation for each measurement
  3. Uses descriptive activity names to name the activities in the dataset  
  4. Appropriately labels the data set with descriptive variable names
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
 

### Libraries used
  + dplyr
  + reshape2
  
### Functions
  * __run_analysis__ <- main functions to run the analysis. 
		It takes an option _clean.data_.
		if _clean.data_ is true it will remove _.data_ folder if exists and will redownload the entire dataset from [this url](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into _.data_ folder.
		output: creates _./data/tidy_data.txt_ file
		
  * __get.X__ <- function to merge features variables from test and train set into one. It also sets the syntactically valid names from features file and select only mean and std features.
		returns a data.frame with clean feature dataset
		
  * __get.y__ <- function to load, merge and clean labels data from test and train dataset
		returns a data.frame with clean labels
		
  * __get.subjec__ <- function to load and clean subjects from test and train dataset
		returns a data.frame with clean merged subjects
		
  * __get.sources__ <- function to download and unzip dataset source file from specified _url_ into _.data_ folder.
		_url_: url to download data from
		_clean.data_: boolean optional variable indicating to refresh existing dataset by deleting existing .data folder and redownload entire dataset
		returns: void
		
### How to use
	1. include _run_analysis.R_ script with source("run_analysis.R")
	2. run _run_analysis_ command with or without optional parameters
