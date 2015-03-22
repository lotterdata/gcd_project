#Getting and Cleaning Data Course Project
<br>

##The Tidy Data Set
The final product of this project can be read by placing the file "finaltidy.txt" in the working directory and running the command

> df <- read.table("finaltidy.txt",header=TRUE)

Each row in this data set corresponds to a combination of subject and activity; the particular subject and activity are identified in the first two columns.The remaining columns hold the averages of each of 66 variables observed for the combination of subject and activity corresponding to that row. Details about these variables can be found in CodeBook.md.

##Packages
The code that produces this tidy data set uses two R packages, dplyr and stringr. We assume  students in this course are familiar with dplyr. The stringr package, according to its R help file, "is a set of simple wrappers that make R's string functions more consistent, simpler and easier to use." This project uses the following functions from stringr.

* str_detect: logical value indicating whether a given regular expression is in a given string
* str_sub: returns a substring of a given string with the specified start and end points
* str_locate: returns the first position of a given regular expression within a given string
* str_locate_all: returns a list of all positions of a given regular expression within a given string
* str_replace_all: replaces all occurences of one expression in a string with another
* str_length: returns the length of a given string
* str_c: combines a set of strings

Note that some stringr functions in this code make use of the pipeline operator %>% from dplyr. Just for the reader's information, if you use stringr in a project without dplyr, you can get access to the pipeline operator by using the package magrittr.

##The Code
The code is divided into sections according to the five steps outlining the project requirements. A few of the more complex steps are divided into subsections. These sections and subsections can be identified with the descriptive comments in the code. Fuller explanations of each step are as follows.

###Step 1
In this step we read the files for the test set subjects, activities (y) and measurements (x) and use cbind to place them in a single data frame, comb.test. (Note that we give the name "label" to the column with activity labels; this will be convenient when we use "merge" in Step 3.) We then do the same for the training set files to form comb.train. Finally we combine comb.test and comb.train into a single data frame, comb.all, using rbind.

One thing worth noting is that it is important to combine the subjects, activities, and measurements before applying the merge function, as we will do in step 3. Merge can change the order of the rows in unpredictable ways, thereby breaking the correspondence between meaurements and subject/activity pairs.

###Step 2
In this step, after reading "features.txt" into a data frame, we identify the columns of the data frame whose names include the string "mean(" or "std(". After creating a logical vector that indicates which feature names contain one of these strings, we use the "which" functions to get a list of the corresponding indices. This is necessary because in the data frame comb.all that we created in Step 1, the corresponding columns have indices that are greater by 2 than their initial positions, since subject and activity occupy the first two columns of comb.all. We then subset by index to create a data frame, tidy.select, that has only those columns that will be used in the final product. 

###Step 3
In this step we read "activity_labels.txt" into a data frame activity.table, name its columns, and merge it with tidy.select by joining the "label" column from tidy.select with the "id" column from activity.table. In the resulting data frame, tidy.merge, the first and last columns are redundant: the first is the activity label and the last is the descriptive name of the activity. (Note that merge puts the "by.x" column at the beginning of the resulting data frame.) So we create a new data frame, tidy.prelim, with the columns in the desired order and the non-descriptive first column of tidy.merge omitted.

###Step 4
The first task in this step is to define a function, DescriptName, that transforms a name from the original data set to one that conforms to the format described in the code book for this project, i.e. four components: type, measurement (called "root" in the R code), direction, and domain. Type is identified by extracting the substring between "-" and "(". Root (i.e. the measurement) is identified by extracting the substring extending for the second character to the character predceding "-". The "direction" (which in some cases may actually be the magnitude) is found by examining the last character, using it as the direction if it is X, Y, or Z, and using "Magnitude" as this component of the name in other cases. Finally, the domain is identified by mapping the initial character "t" or "f" to "Time" or "Frequency".

Rather than apply this function to all names in the original data sets, we have retained the list of indices of the desired columns (select.vars) from Step 2, so we can uses this to subset the origianl list of names into the list select.features. We then use sapply to apply DescriptName to these selected variable names and use names() to chaneg the names in tidy.prelim.

###Step 5
In this step we use funcitons from dplyr to create the required tidy data set. We use group\_by to group tidy.prelim by subject and activity and we use summarise_each to take the means of each of the 66 measurement columns. Although it's not necesary to sort by subject and activity in order to meet the technical definition of "tidy", we do so in order to conform to the more common sense of that word.

