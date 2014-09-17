# Overview #

We describe the data (and the variables) that were kept from the original UCI HAR Dataset (last known location at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

In the original dataset, there were 561 features described. Of all them, we have used 66 variables that describe the mean and standard deviation of interest to us

The first column, is the subject that the data was obtained from subjects.txt. This contains the ID of the subject

The second column is the activity that was performed when the data was obtained. This was obtained from the y_[train/test].txt, and subsequently relabelled with the activitylabels.txt as a map. The final result is a factor of 6 different levels describing the activity

The third column describes the measurements taken, of which there are 66 levels. The meaning of the original measurements remain the same (eg tBodyAcc-mean()-X, tBodyAcc-mean()-Y, etc) as per the original UCI HAR Dataset. This was obtained through melting the data using the reshape2 package.

The 4th column describes the mean of the measurements in column 3

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

	measurement Factor

		The type of measurement collected

			1. tBodyAcc-mean()-X
			2. tBodyAcc-mean()-Y
			3. tBodyAcc-mean()-Z
			4. tBodyAcc-std()-X
			5. tBodyAcc-std()-Y
			6. tBodyAcc-std()-Z
			7. tGravityAcc-mean()-X
			8. tGravityAcc-mean()-Y
			9. tGravityAcc-mean()-Z
			10. tGravityAcc-std()-X
			11. tGravityAcc-std()-Y
			12. tGravityAcc-std()-Z
			13. tBodyAccJerk-mean()-X
			14. tBodyAccJerk-mean()-Y
			15. tBodyAccJerk-mean()-Z
			16. tBodyAccJerk-std()-X
			17. tBodyAccJerk-std()-Y
			18. tBodyAccJerk-std()-Z
			19. tBodyGyro-mean()-X
			20. tBodyGyro-mean()-Y
			21. tBodyGyro-mean()-Z
			22. tBodyGyro-std()-X
			23. tBodyGyro-std()-Y
			24. tBodyGyro-std()-Z
			25. tBodyGyroJerk-mean()-X
			26. tBodyGyroJerk-mean()-Y
			27. tBodyGyroJerk-mean()-Z
			28. tBodyGyroJerk-std()-X
			29. tBodyGyroJerk-std()-Y
			30. tBodyGyroJerk-std()-Z
			31. tBodyAccMag-mean()
			32. tBodyAccMag-std()
			33. tGravityAccMag-mean()
			34. tGravityAccMag-std()
			35. tBodyAccJerkMag-mean()
			36. tBodyAccJerkMag-std()
			37. tBodyGyroMag-mean()
			38. tBodyGyroMag-std()
			39. tBodyGyroJerkMag-mean()
			40. tBodyGyroJerkMag-std()
			41. fBodyAcc-mean()-X
			42. fBodyAcc-mean()-Y
			43. fBodyAcc-mean()-Z
			44. fBodyAcc-std()-X
			45. fBodyAcc-std()-Y
			46. fBodyAcc-std()-Z
			47. fBodyAccJerk-mean()-X
			48. fBodyAccJerk-mean()-Y
			49. fBodyAccJerk-mean()-Z
			50. fBodyAccJerk-std()-X
			51. fBodyAccJerk-std()-Y
			52. fBodyAccJerk-std()-Z
			53. fBodyGyro-mean()-X
			54. fBodyGyro-mean()-Y
			55. fBodyGyro-mean()-Z
			56. fBodyGyro-std()-X
			57. fBodyGyro-std()-Y
			58. fBodyGyro-std()-Z
			59. fBodyAccMag-mean()
			60. fBodyAccMag-std()
			61. fBodyBodyAccJerkMag-mean()
			62. fBodyBodyAccJerkMag-std()
			63. fBodyBodyGyroMag-mean()
			64. fBodyBodyGyroMag-std()
			65. fBodyBodyGyroJerkMag-mean()
			66. fBodyBodyGyroJerkMag-std()

	mean Numeric

		The mean of the measurement (in the 3rd column) 

			-1 to 1. Mean of the normalised values, so it will remain in the same range
