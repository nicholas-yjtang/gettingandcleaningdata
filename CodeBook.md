# Overview #

We describe the data (and the variables) that were kept from the original UCI HAR Dataset (last known location at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

In the original dataset, there were 561 features described. Of all them, we have used 66 variables that describe the mean and standard deviation of interest to us

The first column, is the subject that the data was obtained from subjects.txt. This contains the ID of the subject

The second column is the activity that was performed when the data was obtained. This was obtained from the y_[train/test].txt, and subsequently relabelled with the activitylabels.txt as a map. The final result is a factor of 6 different levels describing the activity

The third column describes the measurements taken, of which there are 66 levels. The meaning of the original measurements remain the same as per the original UCI HAR Dataset. This was obtained through melting the data using the reshape2 package. Although the meaning is the same, we have transformed the names of the variables into the following ways
	1. t[xxx] to TimeOf[xxx]. To indicate more clearly it is time
	2. f[xxx] to FrequencyOf[xxx]. To indcate more clearly f refers to the frequency (achieved from FFT)
	3. Acc to Acceleration. To indicate it is measuring acceleration (rather than from the accelerometer)
	4. Gyro to AngularVelocity. To indicate it is measuring angular velocity (rather than from gyroscope)
	5. Mag to Magnitude. To better indicate it is referring to Magnitude
	6. BodyBody to Body. Remove the duplicate and redundant Body
	7. mean() to Mean. To change the mean function to simply just Mean for easier understanding
	8. std() to StandardDeviation. To change the standard deviation function to simply just StandardDeviation for better understanding
	9. [xxx]-X, [xxx]-Y, [xxx]-Z to [xxx]-OnXAxis, [xxx]-OnYAxis, [xxx]-OnZAxis. To clearly indicate the X, Y Z refers to the measurements on the X, Y, Z axis

The 4th column describes the mean of the measurements in column 3. The name of the original

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

			1. FrequencyOfBodyAcceleration-Mean-OnXAxis
			2. FrequencyOfBodyAcceleration-Mean-OnYAxis
			3. FrequencyOfBodyAcceleration-Mean-OnZAxis
			4. FrequencyOfBodyAcceleration-StandardDeviation-OnXAxis
			5. FrequencyOfBodyAcceleration-StandardDeviation-OnYAxis
			6. FrequencyOfBodyAcceleration-StandardDeviation-OnZAxis
			7. FrequencyOfBodyAccelerationJerk-Mean-OnXAxis
			8. FrequencyOfBodyAccelerationJerk-Mean-OnYAxis
			9. FrequencyOfBodyAccelerationJerk-Mean-OnZAxis
			10. FrequencyOfBodyAccelerationJerk-StandardDeviation-OnXAxis
			11. FrequencyOfBodyAccelerationJerk-StandardDeviation-OnYAxis
			12. FrequencyOfBodyAccelerationJerk-StandardDeviation-OnZAxis
			13. FrequencyOfBodyAccelerationJerkMagnitude-Mean
			14. FrequencyOfBodyAccelerationJerkMagnitude-StandardDeviation
			15. FrequencyOfBodyAccelerationMagnitude-Mean
			16. FrequencyOfBodyAccelerationMagnitude-StandardDeviation
			17. FrequencyOfBodyAngularVelocity-Mean-OnXAxis
			18. FrequencyOfBodyAngularVelocity-Mean-OnYAxis
			19. FrequencyOfBodyAngularVelocity-Mean-OnZAxis
			20. FrequencyOfBodyAngularVelocity-StandardDeviation-OnXAxis
			21. FrequencyOfBodyAngularVelocity-StandardDeviation-OnYAxis
			22. FrequencyOfBodyAngularVelocity-StandardDeviation-OnZAxis
			23. FrequencyOfBodyAngularVelocityJerkMagnitude-Mean
			24. FrequencyOfBodyAngularVelocityJerkMagnitude-StandardDeviation
			25. FrequencyOfBodyAngularVelocityMagnitude-Mean
			26. FrequencyOfBodyAngularVelocityMagnitude-StandardDeviation
			27. TimeOfBodyAcceleration-Mean-OnXAxis
			28. TimeOfBodyAcceleration-Mean-OnYAxis
			29. TimeOfBodyAcceleration-Mean-OnZAxis
			30. TimeOfBodyAcceleration-StandardDeviation-OnXAxis
			31. TimeOfBodyAcceleration-StandardDeviation-OnYAxis
			32. TimeOfBodyAcceleration-StandardDeviation-OnZAxis
			33. TimeOfBodyAccelerationJerk-Mean-OnXAxis
			34. TimeOfBodyAccelerationJerk-Mean-OnYAxis
			35. TimeOfBodyAccelerationJerk-Mean-OnZAxis
			36. TimeOfBodyAccelerationJerk-StandardDeviation-OnXAxis
			37. TimeOfBodyAccelerationJerk-StandardDeviation-OnYAxis
			38. TimeOfBodyAccelerationJerk-StandardDeviation-OnZAxis
			39. TimeOfBodyAccelerationJerkMagnitude-Mean
			40. TimeOfBodyAccelerationJerkMagnitude-StandardDeviation
			41. TimeOfBodyAccelerationMagnitude-Mean
			42. TimeOfBodyAccelerationMagnitude-StandardDeviation
			43. TimeOfBodyAngularVelocity-Mean-OnXAxis
			44. TimeOfBodyAngularVelocity-Mean-OnYAxis
			45. TimeOfBodyAngularVelocity-Mean-OnZAxis
			46. TimeOfBodyAngularVelocity-StandardDeviation-OnXAxis
			47. TimeOfBodyAngularVelocity-StandardDeviation-OnYAxis
			48. TimeOfBodyAngularVelocity-StandardDeviation-OnZAxis
			49. TimeOfBodyAngularVelocityJerk-Mean-OnXAxis
			50. TimeOfBodyAngularVelocityJerk-Mean-OnYAxis
			51. TimeOfBodyAngularVelocityJerk-Mean-OnZAxis
			52. TimeOfBodyAngularVelocityJerk-StandardDeviation-OnXAxis
			53. TimeOfBodyAngularVelocityJerk-StandardDeviation-OnYAxis
			54. TimeOfBodyAngularVelocityJerk-StandardDeviation-OnZAxis
			55. TimeOfBodyAngularVelocityJerkMagnitude-Mean
			56. TimeOfBodyAngularVelocityJerkMagnitude-StandardDeviation
			57. TimeOfBodyAngularVelocityMagnitude-Mean
			58. TimeOfBodyAngularVelocityMagnitude-StandardDeviation
			59. TimeOfGravityAcceleration-Mean-OnXAxis
			60. TimeOfGravityAcceleration-Mean-OnYAxis
			61. TimeOfGravityAcceleration-Mean-OnZAxis
			62. TimeOfGravityAcceleration-StandardDeviation-OnXAxis
			63. TimeOfGravityAcceleration-StandardDeviation-OnYAxis
			64. TimeOfGravityAcceleration-StandardDeviation-OnZAxis
			65. TimeOfGravityAccelerationMagnitude-Mean
			66. TimeOfGravityAccelerationMagnitude-StandardDeviation


	mean Numeric

		The mean of the measurement (in the 3rd column) 

			-1 to 1. Mean of the normalised values, so it will remain in the same range
