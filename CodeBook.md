# Overview #

We describe the data (and the variables) that were kept from the original UCI HAR Dataset (last known location at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

In the original dataset, there were 561 features described. Of all them, we have used 66 variables that describe the mean and standard deviation of interest to us

The first column, is the subject that the data was obtained from subjects.txt. This contains the ID of the subject

The second column is the activity that was performed when the data was obtained. This was obtained from the y_[train/test].txt, and subsequently relabelled with the activitylabels.txt as a map. The final result is a factor of 6 different levels describing the activity

The rest of the columns, are the 66 variables we selected, which describes the mean of the normalized values of the measurement taken for each subject/activity pair.

# Data Dictionary #

	subject Integer

		The subject ID of the collected data.

			1..30 .Unique identifier assigned for each subject

	activity Factor

		The type of activity performed when the measurement was performed

			1. WALKING
			2. WALKING_UPSTAIRS
			3. WALKING_DOWNSTAIRS
			4. SITTING
			5. STANDING
			6. LAYING

	mean-tBodyAcc-mean()-X Numeric

		The mean of the collected tBodyAcc-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAcc-mean()-Y Numeric

		The mean of the collected tBodyAcc-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAcc-mean()-Z Numeric

		The mean of the collected tBodyAcc-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAcc-std()-X Numeric

		The mean of the collected tBodyAcc-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAcc-std()-Y Numeric

		The mean of the collected tBodyAcc-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAcc-std()-Z Numeric

		The mean of the collected tBodyAcc-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAcc-mean()-X Numeric

		The mean of the collected tGravityAcc-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAcc-mean()-Y Numeric

		The mean of the collected tGravityAcc-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAcc-mean()-Z Numeric

		The mean of the collected tGravityAcc-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAcc-std()-X Numeric

		The mean of the collected tGravityAcc-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAcc-std()-Y Numeric

		The mean of the collected tGravityAcc-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAcc-std()-Z Numeric

		The mean of the collected tGravityAcc-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerk-mean()-X Numeric

		The mean of the collected tBodyAccJerk-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerk-mean()-Y Numeric

		The mean of the collected tBodyAccJerk-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerk-mean()-Z Numeric

		The mean of the collected tBodyAccJerk-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerk-std()-X Numeric

		The mean of the collected tBodyAccJerk-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerk-std()-Y Numeric

		The mean of the collected tBodyAccJerk-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerk-std()-Z Numeric

		The mean of the collected tBodyAccJerk-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyro-mean()-X Numeric

		The mean of the collected tBodyGyro-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyro-mean()-Y Numeric

		The mean of the collected tBodyGyro-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyro-mean()-Z Numeric

		The mean of the collected tBodyGyro-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyro-std()-X Numeric

		The mean of the collected tBodyGyro-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyro-std()-Y Numeric

		The mean of the collected tBodyGyro-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyro-std()-Z Numeric

		The mean of the collected tBodyGyro-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerk-mean()-X Numeric

		The mean of the collected tBodyGyroJerk-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerk-mean()-Y Numeric

		The mean of the collected tBodyGyroJerk-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerk-mean()-Z Numeric

		The mean of the collected tBodyGyroJerk-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerk-std()-X Numeric

		The mean of the collected tBodyGyroJerk-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerk-std()-Y Numeric

		The mean of the collected tBodyGyroJerk-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerk-std()-Z Numeric

		The mean of the collected tBodyGyroJerk-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccMag-mean() Numeric

		The mean of the collected tBodyAccMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccMag-std() Numeric

		The mean of the collected tBodyAccMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAccMag-mean() Numeric

		The mean of the collected tGravityAccMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tGravityAccMag-std() Numeric

		The mean of the collected tGravityAccMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerkMag-mean() Numeric

		The mean of the collected tBodyAccJerkMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyAccJerkMag-std() Numeric

		The mean of the collected tBodyAccJerkMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroMag-mean() Numeric

		The mean of the collected tBodyGyroMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroMag-std() Numeric

		The mean of the collected tBodyGyroMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerkMag-mean() Numeric

		The mean of the collected tBodyGyroJerkMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-tBodyGyroJerkMag-std() Numeric

		The mean of the collected tBodyGyroJerkMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAcc-mean()-X Numeric

		The mean of the collected fBodyAcc-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAcc-mean()-Y Numeric

		The mean of the collected fBodyAcc-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAcc-mean()-Z Numeric

		The mean of the collected fBodyAcc-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAcc-std()-X Numeric

		The mean of the collected fBodyAcc-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAcc-std()-Y Numeric

		The mean of the collected fBodyAcc-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAcc-std()-Z Numeric

		The mean of the collected fBodyAcc-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccJerk-mean()-X Numeric

		The mean of the collected fBodyAccJerk-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccJerk-mean()-Y Numeric

		The mean of the collected fBodyAccJerk-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccJerk-mean()-Z Numeric

		The mean of the collected fBodyAccJerk-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccJerk-std()-X Numeric

		The mean of the collected fBodyAccJerk-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccJerk-std()-Y Numeric

		The mean of the collected fBodyAccJerk-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccJerk-std()-Z Numeric

		The mean of the collected fBodyAccJerk-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyGyro-mean()-X Numeric

		The mean of the collected fBodyGyro-mean()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyGyro-mean()-Y Numeric

		The mean of the collected fBodyGyro-mean()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyGyro-mean()-Z Numeric

		The mean of the collected fBodyGyro-mean()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyGyro-std()-X Numeric

		The mean of the collected fBodyGyro-std()-X per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyGyro-std()-Y Numeric

		The mean of the collected fBodyGyro-std()-Y per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyGyro-std()-Z Numeric

		The mean of the collected fBodyGyro-std()-Z per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccMag-mean() Numeric

		The mean of the collected fBodyAccMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyAccMag-std() Numeric

		The mean of the collected fBodyAccMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyBodyAccJerkMag-mean() Numeric

		The mean of the collected fBodyBodyAccJerkMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyBodyAccJerkMag-std() Numeric

		The mean of the collected fBodyBodyAccJerkMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyBodyGyroMag-mean() Numeric

		The mean of the collected fBodyBodyGyroMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyBodyGyroMag-std() Numeric

		The mean of the collected fBodyBodyGyroMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyBodyGyroJerkMag-mean() Numeric

		The mean of the collected fBodyBodyGyroJerkMag-mean() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair

	mean-fBodyBodyGyroJerkMag-std() Numeric

		The mean of the collected fBodyBodyGyroJerkMag-std() per subject/activity pair

			-1 to 1 .The mean of the normalized values for each subject/activity pair


