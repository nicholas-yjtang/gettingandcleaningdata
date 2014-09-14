library(ffbase)
library(LaF)
library(reshape2)
library(RCurl)

#=============================================================
# @author Nicholas Tang
# The read data function
# @filename the target file we wise to read and load. Note that this will not perform any renaming operations
# @url the url of the location of the original file
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
# @destination the location of the file to download to
# @fileUrl the location of the file to download from 
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
    content_disposition = ""
    #in some online downloads, the headers contain the name of the file under
    #the http header "content-disposition" or "Content-disposition"
    for (header in names(x$header)) {    
      if (header == "Content-disposition" || header == "content-disposition") {
        content_disposition <- x$header[header]
      }
    }
    #in the case where content disposition exists
    if (content_disposition != "") {
      #we use regular expression to attempt to find the location and hence the substring
      #for the name of the file
      regular_expr_match <- "filename="
      download_filename <- substr(content_disposition, gregexpr(regular_expr_match, content_disposition)[[1]][[1]]+nchar(regular_expr_match), nchar(content_disposition))    
      end_index <- gregexpr(";", download_filename)[[1]][[1]] - 1
      #some cases, the filename is the last item in the content-disposition
      if (end_index == -2) {
        end_index <- nchar(download_filename)
      }
      #set the filename to the substring
      download_filename <- substr(download_filename, 1, end_index)
      #remove the " if it is present in the filename
      download_filename <- gsub("[\"]", "", download_filename)      
    }
    #the case where there is no content_disposition. we have to rely on the original filename given earlier
    else {
      download_filename = filename
    }
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
# @filelocation the location of either the training/test data
# @features the data.frame that contains the names of all the features
# @data_directory the path to the location where all of the data is located.
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
  #using LaF and ffbase, mainly due to speed issues
  #the original fwf code would have been the one below, which would have been very slow and difficult under testing situations
  #df <- read.fwf(x_test_location, widths=rep(16,561), colClasses=c("numeric"))
  #the column widths are calculated as 16, and repeated for 561 times, which is the total number of features that exists in the features.txt file
  #the column types are all numeric, laf does not automatically repeat the sequence, so we have to create the repetition explicitly
  laf.df <- laf_open_fwf(x_filelocation, column_widths=rep(16,561),column_types = rep("numeric",561))
  ffdf.df <- laf_to_ffdf(laf.df)
  df <- as.data.frame(ffdf.df)

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

#attempts to download the file before we start
#ensure that you have internet access before you perform this operation
#should this operation fail (for whatever reasons)
#ensure that you download the getdata-projectfiles-UCI HAR Dataset.zip
#and unzip into a folder called ./data under your working folder
get_data("./data/getdata-projectfiles-UCI-HAR-Dataset.zip","https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

#these are some fixed values to the location of the features, activity_labels, and the root data directory path
features_filelocation <- "./data/UCI HAR Dataset/features.txt"
activitylabels_filelocation <- "./data/UCI HAR Dataset/activity_labels.txt"
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

#The project requests for the mean and standard deviation of each measurement
#Although meanFreq() and the observations on angle() using certain observation means, could be
#argued as indeed being a mean in the question, we prefer to believe that
#the mean and std are the features with mean() and std() in their names, 
#for each measurement (tBodyAcc-XYZ, tGravityAcc-XYZ etc)
#we use regular expression to find these columns of interest (and also the reason why we prefer to add the column names first, over selecting first)
#interested_df <- merged_data[,grep(".*([Mm]ean\\(\\))|(std\\(\\))|(subject)|(activity).*", colnames(merged_data))]
interested_df <- merged_data[,grep(".*(mean\\(\\))|(std\\(\\))|(subject)|(activity).*", colnames(merged_data))]

#since the activity labels need to be converted
#we must load the activity labels into a data.frame for us to map
#we give a column name, the level and the activity_name, for easy manipulation
activitylabels <- read.table(activitylabels_filelocation, sep=" ", col.names=c("level", "activity_name"))

#we now factorise the activity column in our interested_df, with the names and levels as loaded previously
interested_df$activity <- factor(interested_df$activity, levels=activitylabels$level, labels=activitylabels$activity_name)

#almost the final step. the last part requires us to find the mean based on the
#subject and the related activity
#we will use reshape2 to help in this
#first create the melted data.frame with the id being the subject and activity
df_melt <- melt(interested_df, id=c("subject", "activity"))

#finally do the dcast, with the subject and each activity
#then perform the mean operation on the vector of results from each variable that is distinct
final_df <- dcast(df_melt, subject + activity ~ variable, mean)

#the end step, to write the output format into a text
write.table(final_df, file="final_output.txt", row.names=FALSE)
