######################################
## Wearable Computing: Samsung data ##
######################################

# checking for and creating directory for data
if(!file.exists("dataCourseProject")){
        dir.create("dataCourseProject")
}

# set working directory
setwd(file.path(getwd(),"dataCourseProject"))

# get data from web
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- file.path(getwd(), "wearableComputing.zip")
download.file(data_url, destfile=file, mode="wb")
#list.files("./")

# downloaded date
dateDownloaded <- date()
#dateDownloaded

# unzip
unzip("wearableComputing.zip")

# list files
# list.files("./UCI HAR Dataset/")

# First: read each file
# read file features.txt
path <- file.path(getwd(), "UCI HAR Dataset/")
features <- read.table(file.path(path,"features.txt"))

# read file X_test.txt
file <- file.path(getwd(), "UCI HAR Dataset/test/X_test.txt")
X_test <- read.table(file)

# read file y_test.txt
file <- file.path(getwd(), "UCI HAR Dataset/test/y_test.txt")
y_test <- read.table(file)

# read file subject_test.txt
file <- file.path(getwd(), "UCI HAR Dataset/test/subject_test.txt")
subject_test <- read.table(file)

# read file X_train.txt
file <- file.path(getwd(), "UCI HAR Dataset/train/X_train.txt")
X_train <- read.table(file)

# read file y_train.txt
file <- file.path(getwd(), "UCI HAR Dataset/train/y_train.txt")
y_train <- read.table(file)

# read file subject_train.txt
file <- file.path(getwd(), "UCI HAR Dataset/train/subject_train.txt")
subject_train <- read.table(file)

# installing/loading the package:
if(!require(plyr)) {
        install.packages("plyr"); require(plyr)}
if(!require(dplyr)) {
        install.packages("dplyr"); require(dplyr)}
if(!require(tidyr)) {
        install.packages("tidyr"); require(tidyr)}


###################################################################
## 1. Merges the training and the test sets to create one data set.

# merge TEST data sets:
valid_column_names <- make.names(names=features[,2], unique=TRUE, allow_=TRUE)
names(X_test) <- valid_column_names
names(y_test) <- "activity"
names(subject_test) <- "subjectID"
testDF <- bind_cols(X_test,y_test,subject_test)

# merge TRAIN data sets:
names(X_train) <- valid_column_names
names(y_train) <- "activity"
names(subject_train) <- "subjectID"
trainDF <- bind_cols(X_train,y_train,subject_train)

# now merge TEST-data and TRAIN-data
# first add new variable 'status' (test/train)
testDF <- mutate(testDF, status="test")
trainDF <- mutate(trainDF, status="train")
totalDF <- bind_rows(testDF,trainDF)


########################################################
## 2. Extracts only the measurements on the mean and 
##    standard deviation for each measurement.

# choosing the columns involving mean or standard deviation
# the entries that include mean() and std() at the end
extractDF <- select(.data = totalDF, activity, subjectID, 
                    matches("\\.(mean|std)\\.\\."))


########################################################
## 3. Uses descriptive activity names to name 
##    the activities in the data set

# read file activity_labels.txt
file <- file.path(getwd(), "UCI HAR Dataset/activity_labels.txt")
activity_labels <- read.table(file)

# convert the integer variable 'activity' to factor variable
# renaming levels of a factor with descriptive activity names
extractDF$activity <- as.factor(extractDF$activity)
vec <- activity_labels[,2]
levels(extractDF$activity) <- vec


#########################################################################
## 4. Appropriately labels the data set with descriptive variable names. 

vec_names <- names(extractDF)
mod1 <- sub("^t", "time", vec_names)
mod2 <- sub("^f", "frequency", mod1)
mod3 <- sub("BodyBody", "Body", mod2)
mod4 <- sub("\\.\\.\\.", "\\.", mod3)
mod5 <- sub("\\.\\.", "\\.", mod4)
# which(duplicated(mod5))
# integer(0)
descriptive_names<- mod5
names(extractDF) <- descriptive_names
# mod1: tBodyAcc.mean...X -> timeBodyAcc.mean...X
# mod2: fBodyAccJerk.mean...Y -> frequencyBodyAccJerk.mean...Y
# mod3: frequencyBodyBodyAccJerkMag.mean.. -> frequencyBodyAccJerkMag.mean..
# mod4: timeBodyAcc.mean...X -> timeBodyAcc.mean.X
# mod5: frequencyBodyAccJerkMag.mean.. -> frequencyBodyAccJerkMag.mean.


####################################################################
## 5. From the data set in step 4, creates a second, independent
##    tidy data set with the average of each variable for each 
##    activity and each subject.

# Checklist for tidy data:
## Does it have headings so I know which columns are which.
## Are the variables in different columns (depending on the wide/long form)
## Are there no duplicate columns

## Group extracDF by the subjectID and activity variable
by_subject_activity <- group_by(extractDF,subjectID,activity)

## return the mean size for each subjectID and each activity
summerize_data <- summarise_each(by_subject_activity, 
                                 funs(mean(., na.rm = TRUE)), 
                                 timeBodyAcc.mean.X:frequencyBodyGyroJerkMag.std.)
## Tidy Data: long form
## variables: subject, activity, measure, mean
summerize_data_long <- gather(summerize_data,measure,mean,-c(subjectID,activity))
str(summerize_data_long)
head(summerize_data_long)

# write in a txt file
write.table(summerize_data_long, file.path(getwd(),"summerizedTidyData_longForm.txt"),
            sep="\t\t\t", quote=FALSE, row.names=FALSE)



