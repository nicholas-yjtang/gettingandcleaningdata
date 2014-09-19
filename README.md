# Contents of project #

  * run\_analysis.R - The R script 
  * README.md - This file you are reading now, with instructions on how the R file works
  * CodeBook.md - The file that describes the columns in the output text file created by run_analysis.R

# Instructions on operating run_analysis.R #

1. Make sure you have installed the following packages, as the run\_analysis.R requires these in order to work correctly
	* ffbase
	* LaF
	* reshape2
	* RCurl
2. For convenience, you can use the following in your RStudio or RConsole. Do not forget to restart your R and clear your global environment before installing  
```
install.packages("ffbase")  
install.packages("LaF")  
install.packages("reshape2")  
install.packages("RCurl")  
```

3. Copy the run_analysis.R into your working directory

4. source the run_analysis.R file. It will perform the analysis. Of interest would be the final_df object. You can use the following code as convenience  
```
source("./run_analysis.R")
```

# Theory of Operation #

We describe below the steps taken to get a tidy data set at the end. At the end we will have the narrow form of the table.


1. Merges the training and the test sets to create one data set.
    1. Download the data over the internet, and place it in the data directory
    2. Unzip this data
    3. Open the features.txt and set it into a data.frame
    4. Open the test set txt file using LaF and ffdf to convert to a data frame
    5. Set the column names of test data frame the with the features data frame
    6. Open the subject table and the activity table
    7. Join the column into the test set dataframe
    8. Repeat 4 to 7 using the train txt file (we use lapply for these operations)
    9. Merge the 2 data.frames using rbind

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    1. Now we subset the mean/std deviation columns data from the measurements. We take a strict view of this and only look for mean() and std(), and perform gsub

3. Uses descriptive activity names to name the activities in the data set
    1. With only the interested columns, we now read in the activity labels, mapping it to level and activity_name
    2. Factorise the activity column, using the levels (in numbers) mapped to the activity name

4. Appropriately labels the data set with descriptive variable names. 
    Using gsub, we will tidy up the variable names to replace the following
    1. t[xxx] to TimeOf[xxx]. To indicate more clearly it is time
    2. f[xxx] to FrequencyOf[xxx]. To indcate more clearly f refers to the frequency (achieved from FFT)
    3. Acc to Acceleration. To indicate it is measuring acceleration (rather than from the accelerometer)
    4. Gyro to AngularVelocity. To indicate it is measuring angular velocity (rather than from gyroscope)
    5. Mag to Magnitude. To better indicate it is referring to Magnitude
    6. BodyBody to Body. Remove the duplicate and redundant Body
    7. mean() to Mean. To change the mean function to simply just Mean for easier understanding
    8. std() to StandardDeviation. To change the standard deviation function to simply just StandardDeviation for better understanding
    9. [xxx]-X, [xxx]-Y, [xxx]-Z to [xxx]-OnXAxis, [xxx]-OnYAxis, [xxx]-OnZAxis. To clearly indicate the X, Y Z refers to the measurements on the X, Y, Z axis

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    1. Perform a melt, with the id being the subject and activity
    2. We use dcast to create a new dataframe that sums each type of measurement by the subject and activity pair
    3. Notice that there are many columns, and all of these columns can be argued as a value (of the type of measurement). See http://vita.had.co.nz/papers/tidy-data.pdf that suggests tidy data are narrow in nature. 
    4. Melt the data once again. This time we just want the narrow form of the data
    5. Replace the variable and value headers with "measurement" and "mean"
    6. Sort the factor for our new variable measurement
    7. Sort the data in the order of subject first, activity second, measurement third

6. Write the data out to a txt file

