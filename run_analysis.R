#This script assumes that "UCI HAR Dataset" has been unzipped and placed in the working directory already
# Put the script in the working directory along with "UCI HAR Dataset" directory -
# To run the script set working directory to source file location and click on 'Source' button

# Read all files required to conduct transformations for final tidy data set - 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")  # 'activity_labels.txt': Links the class labels with their activity name.
features <-  read.table("./UCI HAR Dataset/features.txt") # 'features.txt': Complete list of all features from accelerometer and gyroscope 
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt") #Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt") # Values recorded for test volunteers for above mentioned features
test_label <- read.table("./UCI HAR Dataset/test/y_test.txt") # Activities perfomred by each subjects in the form of labels
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")#Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt") # Values recorded for train volunteers for above mentioned features
train_label <- read.table("./UCI HAR Dataset/train/y_train.txt") # Activities perfomred by each subjects in the form of labels

# Transformations 
names(activity_labels)[1]<- paste("Activity_ID") # Renaming the columns in activity data set for clarity and 'merge' purpose in the code
names(activity_labels)[2]<- paste("Activity_Labels")
colnames(test_set) <- features$V2 # award 561 features as column names for 561 values recorderd for test volunteers
colnames(train_set) <- features$V2 # award 561 features as column names for 561 values recorderd for train volunteers

# TEST Dataset -  
test_intermid <- cbind(test_sub,test_set,test_label) # create data frame from the 3 files generated for test data set
test_intermid$Identifier <- "Test" # Additional 'Identifier' column is defined so that data in the tidy dataset can be easily differentiated 
names(test_intermid)[1]<- paste("Subjects")
names(test_intermid)[563] <- paste("Labels")

# TRAIN Dataset -
train_intermid <- cbind(train_sub,train_set,train_label) # create data frame from the 3 files generated for train data set
train_intermid$Identifier <- "Train" # Additional 'Identifier' column is defined so that data in the tidy dataset can be easily differentiated 
names(train_intermid)[1]<- paste("Subjects")
names(train_intermid)[563] <- paste("Labels")

# Uses descriptive activity names to name the activities in the data set
train_final <- merge (activity_labels,train_intermid,by.x = "Activity_ID",by.y = "Labels", all= FALSE)
test_final <- merge (activity_labels,test_intermid,by.x = "Activity_ID",by.y = "Labels", all= FALSE)

# Merge Test and Train dataset to create one data set - 
tidy_intermid <- rbind(test_final,train_final)

# Extract only the measurements on the mean and standard deviation for each measurement. (search for any pattern in features that has 'std' or 'mean' 
# in the name ignoring the case)
subset_columns <- sort(c(c(1,2,3,565),c(grep("mean", colnames(tidy_intermid) ,ignore.case = TRUE ),grep("std", colnames(tidy_intermid),ignore.case = TRUE ))))
tidy_final <- tidy_intermid[,subset_columns]

# Appropriately labels the data set with descriptive variable names. 
label1 = gsub("\\()","",names(tidy_final)) #  Remove braces from feature names
label2 = gsub("-std$","StdDev",label1) # Rename the word std in the string as 'StdDev'
label3 = gsub("-mean","Mean",label2) # Rename/substitute the word mean in the string as 'Mean'
label4 = gsub("^(t)","Time",label3) # substitute 'Time' in the place of t in the string
label5 = gsub("^(f)","Freq",label4)# substitute 'Freq' in the place of f in the string
colnames(tidy_final) <- label5

# From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
# Performs aggregation with aggregate function as 'mean' on the above created tidy_final data set excluding the descriptive variables
tidy_agg <- as.data.frame(aggregate(. ~ Activity_ID+Activity_Labels+Subjects+Identifier,data = tidy_final,FUN= mean))

# Export the tidy data set  created in last step
write.table(tidy_agg, "./tidy_agg.txt",row.names=FALSE,sep='\t');
