## Script To Run The Analysis for Peer Review Assignment

## Author: Gaurav Goyal


cat("Welcome\n")


cat("Please Wait it Will take Some Time\n\n")

## Reading Files


X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")

y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")

subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")

y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")

subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

##Performing Transformations

a<- cbind(y_test, subject_test)

names(a) <- c("Activity", "Subject")

b<- cbind(y_train, subject_train)

names(b) <- c("Activity", "Subject")

c <- merge(a,b, all=T)

d<- merge(X_train, X_test, all = T)

features <- read.table(".\\UCI HAR Dataset\\features.txt")

names(d) <- features$V2

e <- d[, grep("mean\\(\\)|std\\(\\)", names(d), value=TRUE)]

finalDS <- cbind(c,e);

splitTbl <- split(finalDS, list(finalDS$Subject, finalDS$Activity))

output <- as.data.frame(sapply(splitTbl,colMeans))

actlabels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

levels(actlabels$V2)

ncols <- ncol(output)
nrows <- nrow(actlabels)

for (i in 1:ncols)				## For Providing Names to Activity Row
{ 
  
  for(j in 1:nrows)
  {
    if(output[1,i]==actlabels[j,1])
    {
      output[1,i] = as.character(actlabels[j,2])
      break
    }
  }
  
  
}

write.table(output, file="Output_tidydata_mean_samsung.txt", col.names=FALSE, sep="," )

cat("Analysis is Completed\n\n")


cat("The Output file which is comma seperated is generated in your Working Directory by the name of: \n")


cat(" Output_tidydata_mean_samsung.txt \n\n")

cat("Thank You\n Have A Nice Day\n")

