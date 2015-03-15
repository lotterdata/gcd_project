library(stringr)
library(magrittr)
library(plyr)

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
    direct <- ifelse(end %in% c("X","Y","Z"),end,"magnitude")
    if(direct=="magnitude"){
        root <- str_sub(root,start=1,end=str_length(root)-3)
    }
    type <- str_sub(x,start=str_locate(x,"-")[1]+1,end=str_locate(x,"\\(")[1]-1)
    return(str_c(domain,".",root,".",direct,".",type))
}

#Apply this function to selected features
select.features <- feature.list$V2[select.vars]
descript.names <- sapply(select.features,DescriptName)
names(tidy.prelim) <- c("Subject","Activity",descript.names)
rm(feature.list,select.vars,select.features,DescriptName,descript.names)
