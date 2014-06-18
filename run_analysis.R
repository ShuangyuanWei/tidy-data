library("data.table")

tidy_set <- function(folder="UCI HAR Dataset") {

    labels <- fread(paste(folder, "features.txt",sep="/"))

    read_dataset <- function (type) {
        #type may be 'train' or 'test', it is a folder name part of file name
        #load the measurement dataset and assign column lables
        fileName <- paste(folder, type, paste("X_", type, ".sample.txt", sep=""), sep="/")
        rowdata <- data.table(read.table(fileName))
        
        tidy <- as.data.table(rowdata[,grep("-(std|mean)\\(\\)", labels$V2)])

        #add subject column
        fileName <- paste(folder, type, paste("subject_", type, ".sample.txt", sep=""), sep="/")
        subject <- fread(fileName)
        
        tidy[,subject:=subject$V1]
        
        #add activity column to the dataset 
        #replacing activity code with its descriptive name
        fileName <- paste(folder, type, paste("y_", type, ".sample.txt", sep=""), sep="/")
        activity <- fread(fileName)
        
        tidy[,activity:=activity$V1]
        
        tidy
        
    }
    
    #read and combine two datasets
    data <- rbind(read_dataset("test"), read_dataset("train"))

    #convert to data.table, leave only 'std' and 'mean' calculated columns
    # all the columns containing "-std()" or "-mean()" string in the label
    #data <- as.data.table(rowdata[,grep("-(std|mean)\\(\\)", labels$V2)])
    
    
    actlabels <- fread(paste(folder, "activity_labels.txt",sep="/"))
    data[,activity:=factor(data$activity, 
                           levels=actlabels$V1, 
                           labels=actlabels$V2)]
    
    data
}

