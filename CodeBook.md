The tidy_data project uses data from the UCI HAR Dataset, available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The original dataset is comprised of measurements from smartphone accelerometers and gryroscopes worn by 30 participatns as they performed specific activities.  

The specific activites are:
walking
walking upstairs
walking downstairs

sitting
standing
laying.


The raw data were processed by the UCI lab to produce numerous signals, several of which are produced in each of three dimensions, X, Y, and Z.  The signals are:
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
fBodyGyroJerkMag.

The lab's processing produced summary statistics for these signals.  The statistics are:
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

The lab also produced these additional measures:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean.

The lab-processed data is divided into two datasets for the purposes of training a predictive model and testing it.  In all, there  are 561 measurement values for each observation.

The script "run_analysis.r" operates on the "test" and "train" data, first by collecting the components of each data subset, and then combining the two data subsets.  The script then excludes all measurements not realted to the mean or standard deviation, and tidies the data.  The resulting tidy dataset provides the mean value for each subject-activity-signal-function-axis combination.  