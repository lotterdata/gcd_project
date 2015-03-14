options(digits=8)

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

#Get labels and variable names
feature.table <- read.table("features.txt")
activity.table <- read.table("activity_labels.txt")