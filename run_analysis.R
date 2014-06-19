library("data.table")

tidy_set <- function(folder="UCI HAR Dataset") {

    labels <- read.table(paste(folder, "features.txt",sep="/"), stringsAsFactors=FALSE)
    columns <- grep("-(std|mean)\\(\\)", labels$V2)
    
    tidy_labels <- gsub("\\(|\\)","", gsub("-", ".", labels[columns, 2]))

    read_dataset <- function (type) {
        #type may be 'train' or 'test', it is a folder name part of file name
        #load the measurement dataset and assign column lables
        fileName <- paste(folder, type, paste("X_", type, ".txt", sep=""), sep="/")
        rowdata <- read.table(fileName)
        
        tidy <- rowdata[,columns]

        setnames(tidy, tidy_labels) 
        
        #add subject column
        fileName <- paste(folder, type, paste("subject_", type, ".txt", sep=""), sep="/")
        subject <- fread(fileName)
        
        tidy$subject <- subject$V1
        
        #add activity column to the dataset 
        #replacing activity code with its descriptive name
        fileName <- paste(folder, type, paste("y_", type, ".txt", sep=""), sep="/")
        activity <- fread(fileName)
        
        tidy$activity <- activity$V1
        
        as.data.table(tidy)
        
    }
    
    #read and combine two datasets
    data <- rbind(read_dataset("test"), read_dataset("train"))

    #convert to data.table, leave only 'std' and 'mean' calculated columns
    # all the columns containing "-std()" or "-mean()" string in the label

    
    actlabels <- fread(paste(folder, "activity_labels.txt",sep="/"))
    data[,activity:=factor(data$activity, 
                           levels=actlabels$V1, 
                           labels=actlabels$V2)]
    
    #last manipulataion on data to find average of all the columns
    #grouped by subject and activity fields
    data[,lapply(.SD,mean),by=c("activity","subject")]
}

