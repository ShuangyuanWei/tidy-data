library("data.table")

read_dataset <- function (folder="UCI HAR Dataset") {
    labels = fread(paste(folder, "features.txt",sep="\\"))
    
    sfile = paste(folder, "test", "subject_test.txt",sep="\\")
    subject = fread(sfile)
    
    lfile = paste(folder, "test", "y_test.txt",sep="\\")
    activity = fread(lfile)
    
    #open the measurement dataset and assign column lables
    #convert it to data.table (fread fails reading source file)
    dfile = paste(folder, "test", "X_test.sample.txt",sep="\\")
    data <- as.data.table(read.table(dfile, col.names=labels[,V2]))

    #add activity column to the dataaset
    data[,activity:=activity[[1]]]
    #replaces activity factor code by descriptive name
    #todo
    head(data,1)
}