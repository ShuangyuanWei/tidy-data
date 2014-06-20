# Coursera 'Getting and Cleanind Data' course project
# Ths script is transforming dataset available from 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# dataset must be downloaded and unpacked into the local folder
library("data.table")

tidy_set <- function(folder="UCI HAR Dataset") {
    # Args:
    #   folder: folder path for source data. Ommiting this parametere will
    #     make script look up in ./UCI HAR Dataset as it has been created
    #     unzipping original data in the script's current folder
    #
    # Returns:
    #   Tidy data set as requested by course project requirements
    #   se README.md for details
    
    # load data labels wich are common for two data sets
    labels <- read.table(paste(folder, "features.txt",sep="/"), 
                         stringsAsFactors=FALSE)
    
    # create columnn list and tidy labels for data filtering and labeling
    columns <- grep("-(std|mean)\\(\\)", labels$V2)
    tidy_labels <- gsub("\\(|\\)","", gsub("-", "_", labels[columns, 2]))

    #internal function loading and transforming source data into data.table
    #loads files from folder specified by folder variable
    read_dataset <- function (type) {
        # Args: 
        #    type: may be 'train' or 'test', it is used to select proper folder
        #          and as part of file name
        fileName <- paste(folder, type, paste("X_", type, ".txt", sep=""), sep="/")
        rowdata <- read.table(fileName)
        
        #only leave relevant columns (step #2)
        tidy <- rowdata[,columns]
        #set descriptinve names to columns (step #3)
        setnames(tidy, tidy_labels) 
        
        #add subject column
        fileName <- paste(folder, type, paste("subject_", type, ".txt", sep=""), sep="/")
        subject <- fread(fileName)
        
        tidy$subject <- subject$V1
        
        #add activity column  
        fileName <- paste(folder, type, paste("y_", type, ".txt", sep=""), sep="/")
        activity <- fread(fileName)
        
        tidy$activity <- activity$V1
        
        #transform data.frame into data.table facilitating following data merge
        #and transformation
        as.data.table(tidy)
        
    }
    
    #read and combine two datasets, resulting object is data table
    #it has all thec colunns properly named and rows sequentially numbered
    data <- rbind(read_dataset("test"), read_dataset("train"))

    #replace activity codes with descriptive names
    actlabels <- fread(paste(folder, "activity_labels.txt",sep="/"))
    data[,activity:=factor(data$activity, 
                           levels=actlabels$V1, 
                           labels=actlabels$V2)]
    
    # last manipulataion on data to find average values of all the columns
    # grouped by subject and activity fields. 
    # Returning resulting data table 
    data[,lapply(.SD,mean),by=c("activity","subject")]
}
