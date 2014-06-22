tidy-data
=========

## Summary
Course project for Coursera Getting and Cleaning Data online course

The `run_analysis.R` script processes data set available for download from
   (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

as it is required by course project requirements:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## Script
#### dependencies
The script will require `data.table` and `reshape2` packages

#### executing
Unzip downloaded data archive into script's directory, there should be new sub-folder named `UCI HAR Dataset` where the script will read the data from.
Main script to run is `run_analysis.R`. It expects a parameter with name of the folder where tthe raw data had been unpacked to. If input parameter is omitted, the script will try to look for `UCI HAR Dataset` folder in its source directory.

Script could be run by issuing
```R
source('./run_analysis.R')
data <- tidy_set()
```

or to explicitly specify data folder

```R
data <- tidy_set('/tmp/data/UCI HAR Dataset')
```

#### output
Returned object is of `data.table` class, it contains `11880` rows and `4` columns described in details in `CodeBook.md`
Resulting data could be saved into `tidy_data.txt` file by the following command
```R
write.table(data, file="tidy_data.txt", row.names=FALSE)
```
