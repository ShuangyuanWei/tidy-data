library("data.table")

read_dataset <- function (folder="UCI HAR Dataset") {
    labels <- fread(paste(folder, "features.txt",sep="\\"))
    
    sfile <- paste(folder, "test", "subject_test.txt",sep="\\")
    subject <- fread(sfile)
    
    #open the measurement dataset and assign column lables
    #convert it to data.table (fread fails reading source file)
    rowdata = read.table(paste(folder, "test", "X_test.sample.txt",sep="\\"), 
                         col.names=labels$V2)
    #converting data.table, leave only 'std' and 'mean' calculated columns
    # all the columns containing "-std()" or "-mean()" string in the label
    data <- as.data.table(rowdata[,grep("-(std|mean)\\(\\)", labels$V2)])
    
    #add activity column to the dataaset
    data[,activity:=get_activities(folder)]
    #replaces activity factor code by descriptive name
    #todo
    head(data)
}

get_activities <- function(folder="UCI HAR Dataset") {
    actlabels <- fread(paste(folder, "activity_labels.txt",sep="\\"))
    
    actdata <- fread(paste(folder, "test", "y_test.txt",sep="\\"))
    
    #create factor translating activity code to descriptive names
    factor(actdata$V1, levels=actlabels$V1, labels=actlabels$V2)
    
}