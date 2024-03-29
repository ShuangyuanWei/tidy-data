## Study design

### data origin
The data is a recombination and summary of dataset originally available to download from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### merging and filtering
Original dataset information is described in details in its codebook `features_info.txt` included within `.zip` archive. Final dataset combines both **train** and **test** data but only variables representing **mean** and **standard deviation** measurements: column names were filtered so that only ones containing strings `-mean()` or `-std()` were included. 

Resulting dataset was augmented with **activity** (in verbal form) and **subject** values

### final calculation
Average values (mean) of all the variables were then calculated grouping data by **activity** and **subject**. 
Resulting data set has one line per **subject/activity/feature** combination 


##Code book

The following variables are present in the data

1 - activity - type of activity, `WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING`                 

2 - subject - code of the person who was doing the activity                  

3 - feature - original *feature* as presented in source data (see section **Feature selection** below)

4 - average - average value of named feature for given **subject/activity**

All *feature* measurements keep their original units as described below.

##Feature Selection 

(this section has been copied *as is* from original `features_info.txt`)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`. These time domain signals (prefix `t` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag`. (Note the `f` to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
`-XYZ` is used to denote 3-axial signals in the `X`, `Y` and `Z` directions.
```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

The set of variables that were estimated from these signals are: 

`mean()`: Mean value
`std()`: Standard deviation
`mad()`: Median absolute deviation 
`max()`: Largest value in array
`min()`: Smallest value in array
`sma()`: Signal magnitude area
`energy()`: Energy measure. Sum of the squares divided by the number of values. 
`iqr()`: Interquartile range 
`entropy()`: Signal entropy
`arCoeff()`: Autorregresion coefficients with Burg order equal to 4
`correlation()`: correlation coefficient between two signals
`maxInds()`: index of the frequency component with largest magnitude
`meanFreq()`: Weighted average of the frequency components to obtain a mean frequency
`skewness()`: skewness of the frequency domain signal 
`kurtosis()`: kurtosis of the frequency domain signal 
`bandsEnergy()`: Energy of a frequency interval within the 64 bins of the FFT of each window.
`angle()`: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
```
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```
The complete list of variables of each feature vector is available in `features.txt`
