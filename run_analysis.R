# Coursera 'Getting and Cleanind Data' course project
# Ths script is transforming dataset available from 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# dataset must be downloaded and unpacked into the local folder
library("data.table")
library("reshape2")

tidy_set <- function(folder="UCI HAR Dataset") {
    # Args:
    #   folder: folder path for source data. Ommiting this parametere will
    #     make script look up in ./UCI HAR Dataset as it has been created
    #     unzipping original data in the script's current folder
    #
    # Returns:
    #   Tidy narrow data set as requested by course project requirements
    #   se README.md for details
    
    # load data labels wich are common for two data sets
    labels <- read.table(paste(folder, "features.txt",sep="/"), 
                         stringsAsFactors=FALSE)
    
    # create columnn list to filter out mean and std. deviation values
    columns <- grep("-(std|mean)\\(\\)", labels$V2)

    #internal function loading and transforming source data into data.table
    #loads files from direcotry specified by folder variable
    read_dataset <- function (type) {
        # Args: 
        #    type: may be 'train' or 'test', it is used to select proper folder
        #          and as part of file name
        fileName <- paste(folder, type, 
                          paste("X_", type, ".txt", sep=""), sep="/")
        rowdata <- read.table(fileName)
        
        #only leave relevant columns (step #2)
        d <- rowdata[,columns]
        #set descriptinve names to columns (step #3)
        setnames(d, labels[columns, 2]) 
        
        #add subject column
        fileName <- paste(folder, type, 
                          paste("subject_", type, ".txt", sep=""), sep="/")
        subject <- fread(fileName)
        
        d$subject <- subject$V1
        
        #add activity column  
        fileName <- paste(folder, type, 
                          paste("y_", type, ".txt", sep=""), sep="/")
        activity <- fread(fileName)
        
        d$activity <- activity$V1
        
        #transform data.frame into data.table facilitating following data merge
        #and transformation
        as.data.table(d)
        
    }
    
    #read and combine two datasets, resulting object is data table
    #it has all thec colunns properly named and rows sequentially numbered
    data <- rbind(read_dataset("test"), read_dataset("train"))

    #replace activity codes with descriptive names
    actlabels <- fread(paste(folder, "activity_labels.txt",sep="/"))
    data[,activity:=factor(data$activity, 
                           levels=actlabels$V1, 
                           labels=actlabels$V2)]
    
    # calculate average values of all the columns
    # grouped by subject and activity fields. 
    # Returning resulting data table 
    tidy <- data[,lapply(.SD,mean),by=c("activity","subject")]
    
    # reshaping dataset to produce narrow tidy data set
    melt(tidy,id=c("activity","subject"), variable.name="feature", value.name="average")
}
