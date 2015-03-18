library(stringr)
library(magrittr)
library(dplyr)

#Step 1: Merge the training and the test sets to create one data set.

#Load the test data
subject.test <- readLines("test/subject_test.txt")
x.test <- read.table("test/X_test.txt")
y.test <- readLines("test/y_test.txt")
comb.test <- data.frame(cbind(subject=subject.test,label=y.test,x.test))
rm(subject.test,x.test,y.test)

#Load the training data
subject.train <- readLines("train/subject_train.txt")
x.train <- read.table("train/X_train.txt")
y.train <- readLines("train/y_train.txt")
comb.train <- data.frame(cbind(subject=subject.train,label=y.train,x.train))
rm(subject.train,x.train,y.train)

#Combine test and training data
comb.all <- rbind(comb.test,comb.train)
rm(comb.test,comb.train)

#Step 2: Extract only the measurements on the mean and standard deviation 
#for each measurement.
feature.list <- read.table("features.txt")
mean.vars <- sapply(feature.list$V2,str_detect,"mean\\(")
std.vars <- sapply(feature.list$V2,str_detect,"std\\(")
select.vars <- which(mean.vars|std.vars)
tidy.select<- comb.all[,c(1,2,2+select.vars)]
rm(comb.all,mean.vars,std.vars)

#Step 3: Use descriptive activity names to name the activities in the data set
activity.table <- read.table("activity_labels.txt")
names(activity.table) <- c("id","activity")
tidy.merge <- merge(tidy.select,activity.table,by.x="label",by.y="id")
tidy.prelim <- cbind(tidy.merge[2],activity=tidy.merge[69],tidy.merge[,3:68])
rm(activity.table,tidy.select,tidy.merge)

#Step 4: Appropriately labels the data set with descriptive variable names. 

#Function for calculating descriptive names
DescriptName <- function(x){
    domain <- ifelse(str_sub(x,start=1,end=1)=="t","Time","Frequency")
    root <- str_sub(x,start=2,end=str_locate(x,"-")[1]-1) %>%
        str_replace_all("Acc","Accelerometer") %>%
        str_replace_all("Gyro","Gyroscope")
    last.char.pos <- str_locate_all(x,"-")[[1]][2] +1
    end <- str_sub(x,start=last.char.pos,end=last.char.pos)
    direct <- ifelse(end %in% c("X","Y","Z"),end,"Magnitude")
    if(direct=="Magnitude"){
        root <- str_sub(root,start=1,end=str_length(root)-3)
    }
    type <- str_sub(x,start=str_locate(x,"-")[1]+1,end=str_locate(x,"\\(")[1]-1)
    return(str_c(type,".",root,".",direct,".",domain))
}

#Apply this function to selected features
select.features <- feature.list$V2[select.vars]
descript.names <- sapply(select.features,DescriptName)
names(tidy.prelim) <- c("Subject","Activity",descript.names)
#write.table(descript.names,"field_names.csv")
rm(feature.list,select.vars,select.features,DescriptName,descript.names)

#Step 5: From the data set in step 4, create a second, independent 
#        tidy data set with the average of each variable for each activity 
#        and each subject.


tidy.final <- group_by(tidy.prelim,Subject,Activity) %>%
    summarise(
        mean.BodyAccelerometer.X.Time=mean(mean.BodyAccelerometer.X.Time),
        mean.BodyAccelerometer.Y.Time=mean(mean.BodyAccelerometer.Y.Time),
        mean.BodyAccelerometer.Z.Time=mean(mean.BodyAccelerometer.Z.Time),
        std.BodyAccelerometer.X.Time=mean(std.BodyAccelerometer.X.Time),
        std.BodyAccelerometer.Y.Time=mean(std.BodyAccelerometer.Y.Time),
        std.BodyAccelerometer.Z.Time=mean(std.BodyAccelerometer.Z.Time),
        mean.GravityAccelerometer.X.Time=mean(mean.GravityAccelerometer.X.Time),
        mean.GravityAccelerometer.Y.Time=mean(mean.GravityAccelerometer.Y.Time),
        mean.GravityAccelerometer.Z.Time=mean(mean.GravityAccelerometer.Z.Time),
        std.GravityAccelerometer.X.Time=mean(std.GravityAccelerometer.X.Time),
        std.GravityAccelerometer.Y.Time=mean(std.GravityAccelerometer.Y.Time),
        std.GravityAccelerometer.Z.Time=mean(std.GravityAccelerometer.Z.Time),
        mean.BodyAccelerometerJerk.X.Time=mean(mean.BodyAccelerometerJerk.X.Time),
        mean.BodyAccelerometerJerk.Y.Time=mean(mean.BodyAccelerometerJerk.Y.Time),
        mean.BodyAccelerometerJerk.Z.Time=mean(mean.BodyAccelerometerJerk.Z.Time),
        std.BodyAccelerometerJerk.X.Time=mean(std.BodyAccelerometerJerk.X.Time),
        std.BodyAccelerometerJerk.Y.Time=mean(std.BodyAccelerometerJerk.Y.Time),
        std.BodyAccelerometerJerk.Z.Time=mean(std.BodyAccelerometerJerk.Z.Time),
        mean.BodyGyroscope.X.Time=mean(mean.BodyGyroscope.X.Time),
        mean.BodyGyroscope.Y.Time=mean(mean.BodyGyroscope.Y.Time),
        mean.BodyGyroscope.Z.Time=mean(mean.BodyGyroscope.Z.Time),
        std.BodyGyroscope.X.Time=mean(std.BodyGyroscope.X.Time),
        std.BodyGyroscope.Y.Time=mean(std.BodyGyroscope.Y.Time),
        std.BodyGyroscope.Z.Time=mean(std.BodyGyroscope.Z.Time),
        mean.BodyGyroscopeJerk.X.Time=mean(mean.BodyGyroscopeJerk.X.Time),
        mean.BodyGyroscopeJerk.Y.Time=mean(mean.BodyGyroscopeJerk.Y.Time),
        mean.BodyGyroscopeJerk.Z.Time=mean(mean.BodyGyroscopeJerk.Z.Time),
        std.BodyGyroscopeJerk.X.Time=mean(std.BodyGyroscopeJerk.X.Time),
        std.BodyGyroscopeJerk.Y.Time=mean(std.BodyGyroscopeJerk.Y.Time),
        std.BodyGyroscopeJerk.Z.Time=mean(std.BodyGyroscopeJerk.Z.Time),
        mean.BodyAccelerometer.Magnitude.Time=mean(mean.BodyAccelerometer.Magnitude.Time),
        std.BodyAccelerometer.Magnitude.Time=mean(std.BodyAccelerometer.Magnitude.Time),
        mean.GravityAccelerometer.Magnitude.Time=mean(mean.GravityAccelerometer.Magnitude.Time),
        std.GravityAccelerometer.Magnitude.Time=mean(std.GravityAccelerometer.Magnitude.Time),
        mean.BodyAccelerometerJerk.Magnitude.Time=mean(mean.BodyAccelerometerJerk.Magnitude.Time),
        std.BodyAccelerometerJerk.Magnitude.Time=mean(std.BodyAccelerometerJerk.Magnitude.Time),
        mean.BodyGyroscope.Magnitude.Time=mean(mean.BodyGyroscope.Magnitude.Time),
        std.BodyGyroscope.Magnitude.Time=mean(std.BodyGyroscope.Magnitude.Time),
        mean.BodyGyroscopeJerk.Magnitude.Time=mean(mean.BodyGyroscopeJerk.Magnitude.Time),
        std.BodyGyroscopeJerk.Magnitude.Time=mean(std.BodyGyroscopeJerk.Magnitude.Time),
        mean.BodyAccelerometer.X.Frequency=mean(mean.BodyAccelerometer.X.Frequency),
        mean.BodyAccelerometer.Y.Frequency=mean(mean.BodyAccelerometer.Y.Frequency),
        mean.BodyAccelerometer.Z.Frequency=mean(mean.BodyAccelerometer.Z.Frequency),
        std.BodyAccelerometer.X.Frequency=mean(std.BodyAccelerometer.X.Frequency),
        std.BodyAccelerometer.Y.Frequency=mean(std.BodyAccelerometer.Y.Frequency),
        std.BodyAccelerometer.Z.Frequency=mean(std.BodyAccelerometer.Z.Frequency),
        mean.BodyAccelerometerJerk.X.Frequency=mean(mean.BodyAccelerometerJerk.X.Frequency),
        mean.BodyAccelerometerJerk.Y.Frequency=mean(mean.BodyAccelerometerJerk.Y.Frequency),
        mean.BodyAccelerometerJerk.Z.Frequency=mean(mean.BodyAccelerometerJerk.Z.Frequency),
        std.BodyAccelerometerJerk.X.Frequency=mean(std.BodyAccelerometerJerk.X.Frequency),
        std.BodyAccelerometerJerk.Y.Frequency=mean(std.BodyAccelerometerJerk.Y.Frequency),
        std.BodyAccelerometerJerk.Z.Frequency=mean(std.BodyAccelerometerJerk.Z.Frequency),
        mean.BodyGyroscope.X.Frequency=mean(mean.BodyGyroscope.X.Frequency),
        mean.BodyGyroscope.Y.Frequency=mean(mean.BodyGyroscope.Y.Frequency),
        mean.BodyGyroscope.Z.Frequency=mean(mean.BodyGyroscope.Z.Frequency),
        std.BodyGyroscope.X.Frequency=mean(std.BodyGyroscope.X.Frequency),
        std.BodyGyroscope.Y.Frequency=mean(std.BodyGyroscope.Y.Frequency),
        std.BodyGyroscope.Z.Frequency=mean(std.BodyGyroscope.Z.Frequency),
        mean.BodyAccelerometer.Magnitude.Frequency=mean(mean.BodyAccelerometer.Magnitude.Frequency),
        std.BodyAccelerometer.Magnitude.Frequency=mean(std.BodyAccelerometer.Magnitude.Frequency),
        mean.BodyBodyAccelerometerJerk.Magnitude.Frequency=mean(mean.BodyBodyAccelerometerJerk.Magnitude.Frequency),
        std.BodyBodyAccelerometerJerk.Magnitude.Frequency=mean(std.BodyBodyAccelerometerJerk.Magnitude.Frequency),
        mean.BodyBodyGyroscope.Magnitude.Frequency=mean(mean.BodyBodyGyroscope.Magnitude.Frequency),
        std.BodyBodyGyroscope.Magnitude.Frequency=mean(std.BodyBodyGyroscope.Magnitude.Frequency),
        mean.BodyBodyGyroscopeJerk.Magnitude.Frequency=mean(mean.BodyBodyGyroscopeJerk.Magnitude.Frequency),
        std.BodyBodyGyroscopeJerk.Magnitude.Frequency=mean(std.BodyBodyGyroscopeJerk.Magnitude.Frequency)
        ) 
write.table(tidy.prelim,"prelimtidy.txt",row.name=FALSE)
write.table(tidy.final,"finaltidy.txt",row.name=FALSE)
rm(tidy.prelim,tidy.final)