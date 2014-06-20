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
The script will require `data.table` package which may be installed by 
```
install.packages("data.table")
```

#### running
Main script to run is `run_analysis.R` it is expecting a parameter with the folder where raw data had been unpacked to.
If input parameter is omitted, the script will look for the unzipped data in its source folder.
Unziping data into script's folder will create sub-folder named `UCI HAR Dataset` where the script will read data from.

Script could be run by issuing
```
data <- tidy_set()
```

or to explicitly specify data folder

```
data <- tidy_set('/tmp/data/UCI HAR Dataset')
```

#### output
Returned object is `data.table` contains `180` rows and `68` columns.
Resulting data saved into tidy_data.txt file by 
```
write.table(data, file="tidy_data.txt", row.names=FALSE)
```

variable names and values are described in details in `CodeBook.md`