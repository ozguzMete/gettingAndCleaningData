## THE CODE BOOK

### About Records
For each record it is provided:
* A 66-feature vector with time and frequency domain variables. 
* Its activity name. 
* An identifier of the subject who carried out the experiment.

### About Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

Finally, mean of variables depending on activity and subject was taken hence feature names starts with "AVG_". No transformation applied to data

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation

The complete list of variables of each feature vector is available in next chapter

### Features
activity
subject
AVG_tBodyGyroMag.max..
AVG_tBodyGyroMag.min..
AVG_tBodyGyroMag.sma..
AVG_tBodyGyroMag.arCoeff..2
AVG_tBodyGyroMag.arCoeff..3
AVG_tBodyGyroMag.arCoeff..4
AVG_fBodyGyro.skewness...X
AVG_fBodyGyro.kurtosis...X
AVG_fBodyGyro.skewness...Y
AVG_fBodyGyro.bandsEnergy...9.16
AVG_fBodyGyro.bandsEnergy...17.24
AVG_fBodyGyro.bandsEnergy...25.32
AVG_fBodyAcc.energy...Y
AVG_fBodyAcc.energy...Z
AVG_fBodyAcc.iqr...X
AVG_fBodyAcc.entropy...Z
AVG_fBodyAcc.maxInds.X
AVG_fBodyAcc.maxInds.Y
AVG_fBodyAccJerk.std...Y
AVG_fBodyAccJerk.std...Z
AVG_fBodyAccJerk.mad...X
AVG_fBodyAccJerk.max...Z
AVG_fBodyAccJerk.min...X
AVG_fBodyAccJerk.min...Y
AVG_fBodyAccJerk.bandsEnergy...57.64
AVG_fBodyAccJerk.bandsEnergy...1.16
AVG_fBodyAccJerk.bandsEnergy...17.32
AVG_fBodyAccJerk.bandsEnergy...1.8.1
AVG_fBodyAccJerk.bandsEnergy...9.16.1
AVG_fBodyAccJerk.bandsEnergy...17.24.1
AVG_fBodyAcc.bandsEnergy...1.24
AVG_fBodyAcc.bandsEnergy...9.16.1
AVG_fBodyGyro.bandsEnergy...25.48
AVG_fBodyGyro.bandsEnergy...17.24.1
AVG_fBodyAcc.kurtosis...Z
AVG_fBodyAcc.bandsEnergy...17.24
AVG_fBodyAccJerk.bandsEnergy...49.64.2
AVG_fBodyGyro.mean...X
AVG_fBodyAccJerk.bandsEnergy...1.24.1
AVG_fBodyAccJerk.bandsEnergy...9.16.2
AVG_tGravityAcc.mean...Z
AVG_tGravityAcc.std...X
AVG_tGravityAcc.std...Y
AVG_tGravityAcc.sma..
AVG_tGravityAcc.energy...X
AVG_tGravityAcc.energy...Y
AVG_tBodyAccJerk.min...Y
AVG_tBodyAccJerk.min...Z
AVG_tBodyAccJerk.sma..
AVG_tBodyAccJerk.arCoeff...X.2
AVG_tBodyAccJerk.arCoeff...X.3
AVG_tBodyAccJerk.arCoeff...X.4
AVG_tBodyGyroJerk.arCoeff...Z.4
AVG_tBodyGyroJerk.correlation...X.Y
AVG_tBodyGyroJerk.correlation...X.Z
AVG_tBodyAccMag.arCoeff..1
AVG_tBodyAccMag.arCoeff..2
AVG_tBodyAccMag.arCoeff..3
AVG_tBodyAccJerk.arCoeff...Z.4
AVG_tBodyGyro.mean...Y
AVG_tBodyGyro.max...X
AVG_tBodyGyro.min...Z
AVG_tBodyGyro.arCoeff...Z.3
AVG_tBodyGyroJerk.mean...X
AVG_tBodyGyro.entropy...X
AVG_tBodyGyro.arCoeff...X.3