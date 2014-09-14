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
