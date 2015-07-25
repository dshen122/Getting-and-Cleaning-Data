# Function run_analysis read both train and test data from ata collected from the accelerometers
# from the Samsung Galaxy S smartphone. Then transform the data and put them into the format requried 

run_analysis <- function(){

   
     # read train dataset and related data into data frames
    dstrain <- read.table("train/X_train.txt", head=FALSE)
    
    # get subjects for the train dataset
    dstrainsubject <- read.table("train/subject_train.txt", header=FALSE)
    
    # get activity ids of the observations
    dstrainlabel <- read.table("train/y_train.txt", header=FALSE)


    # read in test dataset and related data into data frame 
     dstest<- read.table("test/X_test.txt", header=FALSE)
     
    # get subjects for the test dataset
    dstestsubject <-read.table("test/subject_test.txt", header= FALSE)

    # get activitiy ids of the observations
    dstestlabel<-read.table("test/y_test.txt", header=FALSE)
    
    # get the names of all measured attributes
    dsfeatures<- read.table("features.txt",header=FALSE)
    

    # update train and test datasets column names to be corresponding attributes
    names(dstrain) <- dsfeatures[,2]
    names(dstest) <- dsfeatures[, 2]

    # get the activity ids and their corresponding names
    dsactivitieslabel <- read.table("activity_labels.txt", header=FALSE)
    
    #add new column ActivityType for train label dataset
    dstrainlabel$ActivityType <- factor(dstrainlabel$V1, levels =dsactivitieslabel[,1], labels=dsactivitieslabel[,2])
    
    #add three new columns Activity ID, Activity Type, and subject to train dataset
    dstrain$ActivityID <- dstrainlabel$V1
    dstrain$ActivityType <- dstrainlabel$ActivityType
    dstrain$Subject <- dstrainsubject$V1
    
    # create new column ActivityType  for the name of activity type
    dstestlabel$ActivityType <- factor(dstestlabel$V1, levels = dsactivitieslabel[,1], labels=dsactivitieslabel[,2])

    #add three new columns Activity ID, Activity Type, and subject to test dataset
    dstest$ActivityID <- dstestlabel$V1
    dstest$ActivityType <- dstestlabel$ActivityType
    dstest$Subject <- dstestsubject$V1



    #combine train and test datasets
    dstotal <-rbind(dstrain, dstest)

    #find out which colulmns contain mean and standar deviation measurement
    selectedcol <-grepl("mean|std", dsfeatures[,2])
    dsselected <- dstotal[,selectedcol]

    # get columns to be included in calculation
    col4calc <- ncol(dsselected)-3
    #  dataset average of each variable for each activity and each subject.
    dssecond <- aggregate(dsselected[,1:col4calc], by=list(type=dsselected$ActivityType, subject=dsselected$Subject), FUN=mean)

    # write to a txt file
    write.table(dssecond, "tidydataset.txt", row.name=FALSE)

}

