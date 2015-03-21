#Tidy Data Code Book

We refer the reader to the code book for the original data for background on the experiment. One point from that source that we note here is that the measurements have all been normalized and placed on a scale from -1 to 1.

As detailed in the original code book, there are 17 fundamental quantities being measusred:

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

Notice that 8 of these measurements contain the suffix "XYZ" while the remaining 9 end with "Mag". In the former case there are actually 3 measurements in the data set, one for the X-axis, one for the Y-Axis, and one for the Z-axis. The variables end in "Mag" are measurements of the magnitude of the vectors whose components are the X, Y, and Z measuremnets. This gives us a total of 8*3+9 = 33 measurements. In our data sets we include only the mean and standard deviation for the mesurements, for a total of 66 data columns. Our criterion for choosing the columns is whether their names in the original data set contained either "mean(" or "std(". Hence variables containing "meanFreq" were excluded, as this is not a measure that is available for quantities in the time domain.

The variable names in our data set have a standard format consisting of four components:

* Type (mean or std)
* Measurement (one of the values from the list above with the initial "t" or "f" omitted and the suffix "-XYZ" or "Mag" dropped)
* "Direction" (X, Y or Z axis or the magnitude)
* Domain (Time or Frequency)