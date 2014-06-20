## Study design

### data origin
The data is recombined and cleand up data originally available from data set downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### merging and filtering
Original dataset information is described in details in the codebook `features_info.txt` included with original `.zip` file. Final dataset combines both **train** and **test** data but only variables representing **mean** and **standard deviation** measurements: column names were filtered so that only ones having strings `-mean()` or `-std()` were remaining. Final dataset has human readeable column name which were taken from original codebook replacing '-', '.' with underscores and removing parenthesis.

Resulting dataset was augmented with **activity** (in verbal form) and **subject** values

### final calculation
Average values (mean) of all the variables was then calculated grouping data by **activity** and **subject** values. 
Resulting data set has one line per **subject/activity** combination with 66 average parameters caluclated per observation

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


##Code book

All variable values are keeping original unit vaules, the following variables are present in the data

 1 - activity - type of activity, `WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING`                 
 2 - subject - code of the person who was doing the activity                  
 3 - tBodyAcc_mean_X          
 4 - tBodyAcc_mean_Y          
 5 - tBodyAcc_mean_Z          
 6 - tBodyAcc_std_X           
 7 - tBodyAcc_std_Y           
 8 - tBodyAcc_std_Z           
 9 - tGravityAcc_mean_X       
10 - tGravityAcc_mean_Y       
11 - tGravityAcc_mean_Z       
12 - tGravityAcc_std_X        
13 - tGravityAcc_std_Y        
14 - tGravityAcc_std_Z        
15 - tBodyAccJerk_mean_X      
16 - tBodyAccJerk_mean_Y      
17 - tBodyAccJerk_mean_Z      
18 - tBodyAccJerk_std_X       
19 - tBodyAccJerk_std_Y       
20 - tBodyAccJerk_std_Z       
21 - tBodyGyro_mean_X         
22 - tBodyGyro_mean_Y         
23 - tBodyGyro_mean_Z         
24 - tBodyGyro_std_X          
25 - tBodyGyro_std_Y          
26 - tBodyGyro_std_Z          
27 - tBodyGyroJerk_mean_X     
28 - tBodyGyroJerk_mean_Y     
29 - tBodyGyroJerk_mean_Z     
30 - tBodyGyroJerk_std_X      
31 - tBodyGyroJerk_std_Y      
32 - tBodyGyroJerk_std_Z      
33 - tBodyAccMag_mean         
34 - tBodyAccMag_std          
35 - tGravityAccMag_mean      
36 - tGravityAccMag_std       
37 - tBodyAccJerkMag_mean     
38 - tBodyAccJerkMag_std      
39 - tBodyGyroMag_mean        
40 - tBodyGyroMag_std         
41 - tBodyGyroJerkMag_mean    
42 - tBodyGyroJerkMag_std     
43 - fBodyAcc_mean_X          
44 - fBodyAcc_mean_Y          
45 - fBodyAcc_mean_Z          
46 - fBodyAcc_std_X           
47 - fBodyAcc_std_Y           
48 - fBodyAcc_std_Z           
49 - fBodyAccJerk_mean_X      
50 - fBodyAccJerk_mean_Y      
51 - fBodyAccJerk_mean_Z      
52 - fBodyAccJerk_std_X       
53 - fBodyAccJerk_std_Y       
54 - fBodyAccJerk_std_Z       
55 - fBodyGyro_mean_X         
56 - fBodyGyro_mean_Y         
57 - fBodyGyro_mean_Z         
58 - fBodyGyro_std_X          
59 - fBodyGyro_std_Y
60 - fBodyGyro_std_Z
61 - fBodyAccMag_mean
62 - fBodyAccMag_std
63 - fBodyBodyAccJerkMag_mean
64 - fBodyBodyAccJerkMag_std
65 - fBodyBodyGyroMag_mean
66 - fBodyBodyGyroMag_std
67 - fBodyBodyGyroJerkMag_mean
68 - fBodyBodyGyroJerkMag_std
