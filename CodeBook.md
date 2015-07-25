# describes the code inside run_analysis.R.


## run_analysis.R consists of the following major functional blocks:

### Get training dataset
Get train data from train/X_train.txt via read.table R function call
Get train subject from train/subject_train.txt for these training observations
Get train activity id from train/y_train.txt for each observation corresponding in the train dataset


### Get test dataset
Get test data from test/X_test.txt via read.table R function call
Get test subject from test/subject_test.txt for these test observations
Get test activity id from test/y_test.txt for each observation corresponding in the test dataset

### Add column labels to acquired data frame
Get measured features of each observation from features.txt file
Label both train and test data set columns with attribute names


### Add additional columns to identify activity id,  activity type, and observation subject 
create a new column named Activity of activity id both training and test datasets
create a new column named ActivityType for both training and test datasets
    Populate above two columns with activity data frame
create a new column subject from subject datasets for training and test datasets

### Merge train and test datasets via rbind function call


### use grepl function call to get all measurements related to mean and standard deviation


### Get dataset with only those measurements

### use aggregate function to calculate average of each variable for each activity and each subject


### use write.table function to create txt file from above data frame


