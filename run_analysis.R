options(digits=8)

subject.test <- readLines("test/subject_test.txt")


x.test <- scan("test/X_test.txt",what='numeric',strip.white=TRUE)
x.test <- matrix(as.double(x.test), nrow = 2947, ncol = 561, byrow=TRUE)


y.test <- readLines("test/y_test.txt")


comb.test <- data.frame(cbind(subject=subject.test,y=y.test,x.test))
rm(subject.test,x.test,y.test)



subject.train <- readLines("train/subject_train.txt")


x.train <- scan("train/X_train.txt",what='numeric',strip.white=TRUE)
x.train <- matrix(as.double(x.train), nrow = 7352, ncol = 561, byrow=TRUE)


y.train <- readLines("train/y_train.txt")


comb.train <- data.frame(cbind(subject=subject.train,y=y.train,x.train))
rm(subject.train,x.train,y.train)

comb.all <- rbind(comb.test,comb.train)
rm(comb.test,comb.train)


