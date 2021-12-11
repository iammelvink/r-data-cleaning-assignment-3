# Set-up env
source("utils/setup_env.R")

# Load required libs
source("utils/loadpackages.R")

# Load data
source("utils/load_data.R")

# URL for data set
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download_data(fileUrl)

# Appropriately labels the data set with descriptive variable names ----

# Load activity labels + features
activity_labels <- fread(
    "./data/UCI HAR Dataset/activity_labels.txt"
    ,
    col.names = c("class_labels", "activity_name")
)
features <- fread("./data/UCI HAR Dataset/features.txt"
                  ,
                  col.names = c("index", "feature_names"))

# Extracts only the measurements on the mean and standard deviation for each measurement ----

features_wanted <-
    grep("(mean|std)\\(\\)", features[, feature_names])
measurements <- features[features_wanted, feature_names]
measurements <- gsub('[()]', '', measurements)

# Load training_dataset datasets
training_dataset <-
    fread("./data/UCI HAR Dataset/train/X_train.txt")[, features_wanted, with = FALSE]
data.table::setnames(training_dataset, colnames(training_dataset), measurements)
train_activities <- fread("./data/UCI HAR Dataset/train/Y_train.txt"
                          ,
                          col.names = c("activity"))
train_subjects <-
    fread("./data/UCI HAR Dataset/train/subject_train.txt"
          ,
          col.names = c("subject_number"))
training_dataset <-
    cbind(train_subjects, train_activities, training_dataset)

# Load testing_dataset datasets
testing_dataset <-
    fread("./data/UCI HAR Dataset/test/X_test.txt")[, features_wanted, with = FALSE]
data.table::setnames(testing_dataset, colnames(testing_dataset), measurements)
test_activities <- fread("./data/UCI HAR Dataset/test/Y_test.txt"
                         ,
                         col.names = c("activity"))
test_subjects <-
    fread("./data/UCI HAR Dataset/test/subject_test.txt"
          ,
          col.names = c("subject_number"))
testing_dataset <-
    cbind(test_subjects, test_activities, testing_dataset)

# Merges the training and the testing_dataset sets to create one data set ----

# merge datasets
combined <- rbind(training_dataset, testing_dataset)

# Uses descriptive activity names to name the activities in the data set ----

# Convert class_labels to activity_name
combined[["activity"]] <- factor(combined[, activity]
                                 , levels = activity_labels[["class_labels"]]
                                 , labels = activity_labels[["activity_name"]])

combined[["subject_number"]] <-
    as.factor(combined[, subject_number])
combined <-
    reshape2::melt(data = combined, id = c("subject_number", "activity"))
combined <-
    reshape2::dcast(data = combined,
                    subject_number + activity ~ variable,
                    fun.aggregate = mean)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject ----
write.table(combined, file = "./data/tidy_dataset.txt", row.names = FALSE)
