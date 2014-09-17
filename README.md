# Contents of project #

  * run_analysis.R - The R script 
  * README.md - This file you are reading now, with instructions on how the R file works
  * CodeBook.md - The file that describes the columns in the output text file created by run_analysis.R

# Instructions on operating run_analysis.R #

1. Make sure you have installed the following packages, as the run_analysis.R requires these in order to work correctly
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

1. Download the data over the internet, and place it in the data directory
2. Unzip this data
3. Open the features.txt and set it into a data.frame
4. Open the test set txt file using LaF and ffdf to convert to a data frame
5. Set the column names of test data frame the with the features data frame
6. Open the subject table and the activity table
7. Join the column into the test set dataframe
8. Repeat 4 to 7 using the train txt file (we use lapply for these operations)
9. Merge the 2 data.frames using rbind
10. Now we subset the mean/std deviation columns data from the measurements. We take a strict view of this and only look for mean() and std()
11. With only the interested columns, we now read in the activity labels, mapping it to level and activity_name
12. Factorise the activity column, using the levels (in numbers) mapped to the activity name
13. Perform a melt, with the id being the subject and activity
14. We use dcast to create a new dataframe that sums each type of measurement by the subject and activity pair
15. Notice that there are many columns, and all of these columns are values (of the type of measurement). See http://vita.had.co.nz/papers/tidy-data.pdf
16. Melt the data once again. This time we just want the narrow form of the data
17. Replace the variable and value headers with "measurement" and "mean"
18. Sort the data in the order of subject first, activity second
19. Write the data out to a txt file

