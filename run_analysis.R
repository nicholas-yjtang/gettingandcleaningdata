library(ffbase)
library(LaF)
library(reshape2)
library(RCurl)

#=============================================================
# @author Nicholas Tang
# the read data function
# @param filename the target file we wise to write to 
# @param url the url of the location of the original file
#==============================================================

get_data <- function(filename, url) { 
  #if the source file already exists, we can simply ignore downloading it again
  if (!file.exists(filename)) {
    #find the directory name
    directory_name <- dirname(filename)
    #if the directory does not exist, we create it
    if (!file.exists(directory_name)) {
      dir.create(directory_name)
    }
    #download the file since the source file does not exist
    download_file(filename, url)    
  }
}

#=======================================================
# Function to download the file
# @param destination the location of the file to download to
# @param fileUrl the location of the file to download from 
#========================================================
download_file <- function (destination, fileUrl) {  
  #set the directory name and filename first
  directory_name <- dirname(destination)  #actual directory destination
  filename <- basename(destination)  #destination filename without the directory path

  #check if the file already exists before downloading again
  #if the file does not exist, then just download it again
  if (!file.exists(destination)) {
    #using RCurl, we can skip the verification of the ssl
    x <- getURLContent(fileUrl, ssl.verifypeer=FALSE, header=TRUE)


     download_filename = filename

    #finally write the contents from memory/connection into the file
    #close the file at the end
    download_file_relativepath = paste(directory_name, download_filename, sep="/")
    to.write = file(download_file_relativepath, "wb")    
    writeBin(x$body[1:length(x$body)],to.write)
    close(to.write)

    #perform the unzip if the filename downloaded is a zip file
    if (length(grep(".*\\.zip", download_filename)) != 0) {    
      unzipped_files <- unzip(download_file_relativepath, exdir = directory_name)    
    } 
  }  
}

#=======================================================
# Function read the data for each file location
# @param filelocation the location of either the training/test data
# @param features the data.frame that contains the names of all the features
# @param data_directory the path to the location where all of the data is located.
#		  the default is already defined as "./data/UCI HAR Dataset"
#========================================================

read_data <- function (filelocation,features,data_directory="./data/UCI HAR Dataset") {

  #first recreate the path to the 3 important files, namely
  #x_filelocation, the location to the X_[test/train].txt data
  #subjects_filelocation, the location to the subject_[test/train].txt
  #activity_filelocation, the location to the y_[test/train].txt  
  x_filelocation <- paste(data_directory, filelocation, paste("X_", filelocation,".txt",sep="") ,sep="/")
  subjects_filelocation <- paste(data_directory, filelocation,paste("subject_", filelocation, ".txt",sep="") ,sep="/")
  activity_filelocation <- paste(data_directory, filelocation, paste("y_", filelocation, ".txt",sep=""), sep="/")  

  #a few things to note in this section
  #firstly we are not going to include the inertia data, although it is a trivial exercise to do so,
  #mainly because these columns do not have names, and we are finally only interested in the mean() and std() of
  #the observations
  #secondly, we will be using LaF and ffbase, mainly due to speed issues
  #the original fwf code would have been the one below, which would have been very slow and difficult under testing situations
  #df <- read.fwf(x_test_location, widths=rep(16,561), colClasses=c("numeric"))

  #the column widths are calculated as 16, and repeated for 561 times, which is the total number of features that exists in the features.txt file
  #the column types are all numeric, laf does not automatically repeat the sequence, so we have to create the repetition explicitly
  laf.df <- laf_open_fwf(x_filelocation, column_widths=rep(16,561),column_types = rep("numeric",561))
  ffdf.df <- laf_to_ffdf(laf.df)
  df <- as.data.frame(ffdf.df)
  close(laf.df)

  #although the sequence (according to the instructions) was to select the features first, before adding the labels
  #there is no harm to do it at this point, and it will make our life easier later when we want to select the columns we are interested in  
  colnames(df) <- features$name

  #now read the 2 remaining files, which is mainly the subjects
  #and also the activity which they are performing
  #since the files only contain one column, we also name the column at this point
  subjects <- read.table(subjects_filelocation, sep=" ", col.names="subject")
  activity <- read.table(activity_filelocation, sep=" ", col.names="activity")  

  #add a new column, the subject and activity column, to the created data.frame we have above
  #set those columns to the subject and activity columns we have just opened
  df$subject <- subjects$subject
  df$activity <- activity$activity
  df
}

#===============================================================
# Performs step1
# Merges the training and the test sets to create one data set.
# Returns a data.frame containing the merged data (of test and training)
#===============================================================

step1 <- function() { 
  
  #attempts to download the file before we start
  #ensure that you have internet access before you perform this operation
  #should this operation fail (for whatever reasons)
  #ensure that you download the getdata-projectfiles-UCI HAR Dataset.zip
  #and unzip into a folder called ./data under your working folder
  #and comment out the below code
  get_data("./data/getdata-projectfiles-UCI-HAR-Dataset.zip","https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

  #these are some fixed values to the location of the features, activity_labels, and the root data directory path
  features_filelocation <- "./data/UCI HAR Dataset/features.txt"
  data_directory <- "./data/UCI HAR Dataset"

  #the two datasets, are located under the test and train folders
  #we create a vector of these two names for later use
  filelocations <- c("test", "train")
  
  #we read in the features list into a data.frame
  #we provide some column names for features, so that it will be easier to manipulate and call for the respective columns
  #rather than using the default V[column_number]
  features <- read.table(features_filelocation, sep=" ", colClasses=c("numeric","character"), col.names=c("index","name"))
  
  #rather than duplicating the call twice (since the reading of the data is esssentially the same)
  #we use lapply instead, with our read_data function
  #the read_data function is defined above
  #this will produce a list of data.frames, which are the train and test data.frames
  split_datas <- lapply(filelocations, read_data, features)  

  #we now do a rowbind to combine all the data together
  #the below call will call rbind over the list split_datas
  merged_data <- do.call("rbind", split_datas)
  merged_data
}

#===============================================================
# Performs step2
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# @param merged_data the merged data.frame that was obtianed from step1()
# Returns a data.frame of interest to us
#===============================================================

step2 <- function(merged_data) {

  #The project requests for the mean and standard deviation of each measurement
  #Although meanFreq() and the observations on angle() using certain observation means, could be
  #argued as indeed being a mean in the question, we prefer to believe that
  #the mean and std are the features with mean() and std() in their names, 
  #for each measurement (tBodyAcc-XYZ, tGravityAcc-XYZ etc)
  #for completion sake, the code that would have taken the meanFreq, along with the special features using angle and mean
  #of certain variables have been included in the next line (but commented out)
  #interested_df <- merged_data[,grep(".*([Mm]ean\\(\\))|(std\\(\\))|(subject)|(activity).*", colnames(merged_data))]
  #we use regular expression to find these columns of interest (and also the reason why we prefer to add the column names first, over selecting first)
  interested_df <- merged_data[,grep(".*(mean\\(\\))|(std\\(\\))|(subject)|(activity).*", colnames(merged_data))]  
  interested_df
}

#===============================================================
# Performs step3
# Uses descriptive activity names to name the activities in the data set
# @param interested_df the interested data.frame that was obtianed from step2()
# Returns a data.frame that will now contain the activity names 
#         as activities rather than numbers
#===============================================================

step3 <- function(interested_df) {

  activitylabels_filelocation <- "./data/UCI HAR Dataset/activity_labels.txt"  
  #since the activity labels need to be converted
  #we must load the activity labels into a data.frame for us to map
  #we give a column name, the level and the activity_name, for easy manipulation
  activitylabels <- read.table(activitylabels_filelocation, sep=" ", col.names=c("level", "activity_name"))
  
  #we now factorise the activity column in our interested_df, with the names and levels as loaded previously
  interested_df$activity <- factor(interested_df$activity, levels=activitylabels$level, labels=activitylabels$activity_name)
  interested_df
}

#===============================================================
# Performs step4
# Appropriately labels the data set with descriptive variable names.
# @param interested_df the interested data.frame that was obtianed from step3()
# Returns a data.frame that will now contain the proper variable names
#===============================================================

step4 <- function(interested_df) {
  
  #here, we are at step 4, we will clean up the names prior to melting the data (before creating the new tidy data)
  #change the beginning t to Time for better indication the variable is related to time
  colnames(interested_df) <- gsub("^t", "TimeOf", colnames(interested_df))
  
  #change the beginning f to Frequency, for better indication thta the variable is related to Frequency
  colnames(interested_df) <- gsub("^f", "FrequencyOf", colnames(interested_df))
  
  #expand the Acc to Acceleration
  colnames(interested_df) <- gsub("Acc", "Acceleration", colnames(interested_df))
  
  #expand the Gryo to AngularVelocity
  colnames(interested_df) <- gsub("Gyro", "AngularVelocity", colnames(interested_df))
  
  #expand the shorted Mag to Magnitude
  colnames(interested_df) <- gsub("Mag", "Magnitude", colnames(interested_df))
  
  #remove duplicate Body
  colnames(interested_df) <- gsub("BodyBody", "Body", colnames(interested_df))
  
  #modify the mean function to indicate just Mean
  colnames(interested_df) <- gsub("mean\\(\\)", "Mean", colnames(interested_df))
  
  #modify the std() function to just StandardDeviation
  colnames(interested_df) <- gsub("std\\(\\)", "StandardDeviation", colnames(interested_df))
  
  #enhance the X,Y,Z indication with the word axis to make it easier it is an axis
  colnames(interested_df) <- gsub("-X", "-OnXAxis", colnames(interested_df))
  colnames(interested_df) <- gsub("-Y", "-OnYAxis", colnames(interested_df))
  colnames(interested_df) <- gsub("-Z", "-OnZAxis", colnames(interested_df))  
  interested_df    
}

#===============================================================
# Performs step5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 
# @param interested_df the interested data.frame that was obtained from step4()
# Returns a data.frame that is tidy
#===============================================================

step5 <- function(interested_df) {
  
  #almost the final step. the last part requires us to find the mean based on the
  #subject and the related activity
  #we will use reshape2 to help in this  
  #first create the melted data.frame with the id being the subject and activity
  df_melt <- melt(interested_df, id=c("subject", "activity"))
  
  #finally do the dcast, with the subject and each activity
  #then perform the mean operation on the vector of results from each variable that is distinct
  final_df <- dcast(df_melt, subject + activity ~ variable, mean)
  
  #melt the data once more. we want to keep the narrow form of the data
  #since the columns are essentially values of the type of measurement used
  #replace the 2 columns, variable and value, with something more meaningful, like "measurement" and "mean"
  #order it with the subject first, and activity second
  tidy_data <- melt(final_df, id=c("subject", "activity"))
  colnames(tidy_data) <- gsub("^variable$" ,"measurement", colnames(tidy_data))
  colnames(tidy_data) <- gsub("^value$" ,"mean", colnames(tidy_data))
  #we do a little more tidying up, by ordering the factors of measurement to be in alphabetical order
  tidy_data$measurement <- factor(as.character(tidy_data$measurement), ordered = TRUE)
  #order the table more neatly
  tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity, tidy_data$measurement),]
  tidy_data
}

#perform the operations according to the steps as highlighted in the assignment
#from 1 to 5
merged_data <- step1()
interested_df <- step2(merged_data)
interested_df <- step3(interested_df)
interested_df <- step4(interested_df)
tidy_data <- step5(interested_df)
  
#the end step, to write the output format into a text
write.table(tidy_data, file="final_output.txt", row.names=FALSE)
