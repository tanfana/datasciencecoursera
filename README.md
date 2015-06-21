==================================================================
Human Activity Recognition Using Smartphones Dataset
(Version 1.0)

==================================================================

* Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
* Smartlab - Non Linear Complex Systems Laboratory
* DITEN - Università degli Studi di Genova.
* Via Opera Pia 11A, I-16145, Genoa, Italy.
* activityrecognition@smartlab.ws
* www.smartlab.ws

===============================================================

The README.md describes the transformations performed by the R script `run_analysis.R` to convert 
the raw data of **Human Activity Recognition Using Smartphones** into tidy data.

=================================================================

I programmed an R script named `run_analysis.R` to convert raw data into tidy data. 

Raw data: Human Activity Recognition Using Smartphones 

Tidy Data, long form: `summerize_data_long`

================================================================
The script uses following files:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

================================================================

#### Workflow: Preparing things before merging: Creating working directory and downloading the raw data from web
* Checking for and creating directory ("dataCourseProject") for my files (data, R script, etc.).
* Setting the directory `dataCourseProject` as working directory.
* Getting [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) `Dataset.zip` from web.
* Unziping the folder to `UCI HAR Dataset`.
* Reading the following files in the folder `UCI HAR Dataset` and check out the dimension:
features.txt, X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt.

#### 1. Merging the training and the test sets to create one data set
* Installing/loading the packages (plyr, dplyr, tidyr).
* Merging first TEST data sets:
	* For X_test.txt use the original column names from features.txt as variable names.
	* Converting invalid characters in the original column names, e.g. '-' to '.'.
	* Naming the column of y_test.txt as `activity`.
	* Naming the column of subject_test.txt as `subjectID`.
	* Merging columnwise the three test sets (X_test, y_test, subject_test).
* Merging TRAIN data sets analogous to TEST data sets.
* Merging TEST-data and TRAIN-data:
	* Adding new variable 'status' in TEST-data and TRAIN-data (with entries "test"/"train").
* Result: `totalDF` data frame.

#### 2. Extracting only the measurements on the mean and standard deviation for each measurement.
* Choosing the columns that involve mean or standard deviation, i.e., the entries that include mean() and std() at the end.
* Result: `extractDF` data frame.

#### 3. Using descriptive activity names to name the activities in the data set
* Reading file activity_labels.txt.
* Converting integer variable `activity` to factor variable in `extractDF` data frame.
* Renaming levels of factor variable `activity` with descriptive activity names from file activity_labels.txt.

#### 4. Appropriately labelling the data set with descriptive variable names
* Modifying the feature labels to descriptive variable names in some steps.
* `t` to `time` etc. (for more information see codebook.md).

#### 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject from the data set in step 4
* Grouping data frame `extracDF` by the `subjectID` and `activity` variable.
* Returning the mean of each variable for each `subjectID` and each `activity` with `summarise_each()` function.
* Creating tidy data in long form with variable names: subjectID, activity, measure, mean.
* Result: `summerize_data_long` data frame.
* Writing data frame in a text file with `write.table()` function.

