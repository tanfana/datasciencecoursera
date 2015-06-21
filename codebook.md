==================================================================

Human Activity Recognition Using Smartphones Dataset in Tidy Long Form

=========================================================================

## Experiment explanation

The experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial 
angular velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency domain.  

=========================================================================

## Tidy data set variables

The tidy data set has four columns with variables names: subjectID, activity, measure, mean

**subjectID (integer variable)**: each row identifies the volunteer who performed the activity for each window sample. Range from 1 to 30.


**activity (factor variable)**: contains six activities performed by each volunteer (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

**measure (factor variable)**: contains 66 features (for more information see below)

**mean (numeric variable)**: contains the average of each measure for each subject and each activity
 

===========================================================================

## Detailed explanation for variable `measure`

Now explain a little bit more the variable `measure`:

I understand the point of descriptive variable names, but as a mathematician I would never 
use a sentence like **the Jerk of the body on the z axis of the phone**
for a variable name.

My point of view is, the reason having a code book is to explain your 
variable names in your data set. And that permit you having not to long
variable names.

Example:
If I have the choice between **tBGJ.Z** and 
**the Jerk of the body on the z axis of the phone** I would prefer something in between.
For example **timeBodyGyroJerk.Z**.

So that why I'm using variable names like **timeBodyGyroJerk.Z**. 
 
==================================================================

The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals timeAcc.XYZ and timeGyro.XYZ. These time domain 
signals were captured at a constant rate of 50 Hz. 

Then they were filtered using a median filter and a 3rd order low pass Butterworth 
filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals 
(timeBodyAcc.XYZ and timeGravityAcc.XYZ) using another low pass Butterworth filter with 
a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time 
to obtain Jerk signals (timeBodyAccJerk.XYZ and timeBodyGyroJerk.XYZ). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm 
(timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing:

frequencyBodyAcc.XYZ, frequencyBodyAccJerk.XYZ, frequencyBodyGyro.XYZ, frequencyBodyAccJerkMag, frequencyBodyGyroMag, frequencyBodyGyroJerkMag.

* timeAcc.XYZ: 3-axial raw signals from the accelerometer
* timeGyro.XYZ: 3-axial raw signals from the gyroscope
* timeBodyAcc.XYZ: 3-axial body acceleration signals
* timeGravityAcc.XYZ: 3-axial gravity acceleration signals
* timeBodyAccJerk.XYZ: The body linear acceleration were derived in time to obtain Jerk signals
* timeBodyGyroJerk.XYZ: The angular velocity were derived in time to obtain Jerk signals
* Mag: The magnitude of these three-dimensional signals
* 

X, Y and Z is used to denote 3-axial signals in the X, Y and Z directions.

* time: Time domain signals
* frequency: Frequency domain signals

The set of variables that were estimated from these signals are: 

* mean: Mean value
* std: Standard deviation

**Example:**

timeBodyAcc.mean.X -> Mean value of body acceleration signals on the x axis

etc.

========================================================================== 

## 66 Levels of Variables `measure`

```R
timeBodyAcc.mean.X
timeBodyAcc.mean.Y
timeBodyAcc.mean.Z
timeBodyAcc.std.X
timeBodyAcc.std.Y
timeBodyAcc.std.Z
timeGravityAcc.mean.X
timeGravityAcc.mean.Y
timeGravityAcc.mean.Z
timeGravityAcc.std.X
timeGravityAcc.std.Y
timeGravityAcc.std.Z
timeBodyAccJerk.mean.X
timeBodyAccJerk.mean.Y
timeBodyAccJerk.mean.Z
timeBodyAccJerk.std.X
timeBodyAccJerk.std.Y
timeBodyAccJerk.std.Z
timeBodyGyro.mean.X
timeBodyGyro.mean.Y
timeBodyGyro.mean.Z
timeBodyGyro.std.X
timeBodyGyro.std.Y
timeBodyGyro.std.Z
timeBodyGyroJerk.mean.X
timeBodyGyroJerk.mean.Y
timeBodyGyroJerk.mean.Z
timeBodyGyroJerk.std.X
timeBodyGyroJerk.std.Y
timeBodyGyroJerk.std.Z
timeBodyAccMag.mean.
timeBodyAccMag.std.
timeGravityAccMag.mean.
timeGravityAccMag.std.
timeBodyAccJerkMag.mean.
timeBodyAccJerkMag.std.
timeBodyGyroMag.mean.
timeBodyGyroMag.std.
timeBodyGyroJerkMag.mean.
timeBodyGyroJerkMag.std.
frequencyBodyAcc.mean.X
frequencyBodyAcc.mean.Y
frequencyBodyAcc.mean.Z
frequencyBodyAcc.std.X
frequencyBodyAcc.std.Y
frequencyBodyAcc.std.Z
frequencyBodyAccJerk.mean.X
frequencyBodyAccJerk.mean.Y
frequencyBodyAccJerk.mean.Z
frequencyBodyAccJerk.std.X
frequencyBodyAccJerk.std.Y
frequencyBodyAccJerk.std.Z
frequencyBodyGyro.mean.X
frequencyBodyGyro.mean.Y
frequencyBodyGyro.mean.Z
frequencyBodyGyro.std.X
frequencyBodyGyro.std.Y
frequencyBodyGyro.std.Z
frequencyBodyAccMag.mean.
frequencyBodyAccMag.std.
frequencyBodyAccJerkMag.mean.
frequencyBodyAccJerkMag.std.
frequencyBodyGyroMag.mean.
frequencyBodyGyroMag.std.
frequencyBodyGyroJerkMag.mean.
frequencyBodyGyroJerkMag.std.
```
