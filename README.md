#Getting and Cleaning Data Course Project
<br>

##The Tidy Data Set
The final product of this project can be read by placing the file "finaltidy.txt" in the working directory and running the command

> df <- read.table("finaltidy.txt",header=TRUE)

Each row in this data set corresponds to a combination of subject and activity; the particular subject and activity are identified in the first two columns.The remaining columns hold the averages of each of 66 variables. Details about these variables can be found in CodeBook.md.

##Packages
The code that produces this tidy data set uses two R packages, dplyr and stringr. I assume  students in this course are familiar with dplyr. The stringr package, according to its R help file, "is a set of simple wrappers that make R's string functions more consistent, simpler and easier to use." This project uses the following functions from stringr.

* str_detect: logical value indicating whether a given regular expression is in a given string
* str_sub: returns a substring of a given string with the specified start and end points
* str_locate: returns the first position of a given regular expression within a given string
* str_locate_all: returns a list of all positions of a given regular expression within a given string
* str_replace_all: replaces all occurences of one expression in a string with another
* str_length: returns the length of a given string
* str_c: combines a set of strings

Note that some stringr functions in this code make use of the pipeline operator %>% from dplyr. Just for the readers information, if you use stringr in a project without dplyr, you can get access to the pipeline operator by using the package maggritr.

##The Code
The code is divided into sections according to the five steps outlining the project requirements. A few of the more complex steps are divided into subsections. These sections and subsections can be identified with the descriptive comments in the code. Fuller explanations of each step are as follows.

###Step 1
In this step we read the files for the test set subjects, activities (y) and measurements (x) and use cbind to place them in a single data frame, comb.test. We then do the same for the training set files to form comb.train. Finally we combine comb.test and comb.train into a single data frame, comb.all, using rbind.

###Step 2

###Step 3

###Step 4

###Step 5