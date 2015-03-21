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

Notice that 8 of these measurements contain the suffix "XYZ" while the remaining 9 end with "Mag". In the former case there are actually 3 measurements in the data set, one for the X-axis, one for the Y-Axis, and one for the Z-axis. The variables ending in "Mag" are measurements of the magnitude of the vectors whose components are the X, Y, and Z measurements. This gives us a total of 8*3+9 = 33 measurements. In our data sets we include only the mean and standard deviation for the mesurements, for a total of 66 data columns. Our criterion for choosing the columns is whether their names in the original data set contained either "mean(" or "std(". Hence variables containing "meanFreq" were excluded, as this is not a measure that is available for quantities in the time domain.

The variable names in our data set (other than the subject and activity identifiers) have a standard format consisting of four components:

* Type (mean or std)
* Measurement (one of the values from the list above with the initial "t" or "f" omitted and the suffix "-XYZ" or "Mag" dropped)
* "Direction" (X, Y or Z axis or the magnitude)
* Domain (Time or Frequency)

The complete set of variables is

1. Subject: An integer identifier for each subject in the study
2. Activity: A brief description of the activity the subject was engaged in when the measurements were taken.
3. mean.BodyAccelerometer.X.Time : Mean of BodyAccelerometer measured along the X-axis in the time domain.
4. mean.BodyAccelerometer.Y.Time : Mean of BodyAccelerometer measured along the Y-axis in the time domain.
5. mean.BodyAccelerometer.Z.Time : Mean of BodyAccelerometer measured along the Z-axis in the time domain.
6. std.BodyAccelerometer.X.Time : Std of BodyAccelerometer measured along the X-axis in the time domain.
7. std.BodyAccelerometer.Y.Time : Std of BodyAccelerometer measured along the Y-axis in the time domain.
8. std.BodyAccelerometer.Z.Time : Std of BodyAccelerometer measured along the Z-axis in the time domain.
9. mean.GravityAccelerometer.X.Time : Mean of GravityAccelerometer measured along the X-axis in the time domain.
10. mean.GravityAccelerometer.Y.Time : Mean of GravityAccelerometer measured along the Y-axis in the time domain.
11. mean.GravityAccelerometer.Z.Time : Mean of GravityAccelerometer measured along the Z-axis in the time domain.
12. std.GravityAccelerometer.X.Time : Std of GravityAccelerometer measured along the X-axis in the time domain.
13. std.GravityAccelerometer.Y.Time : Std of GravityAccelerometer measured along the Y-axis in the time domain.
14. std.GravityAccelerometer.Z.Time : Std of GravityAccelerometer measured along the Z-axis in the time domain.
15. mean.BodyAccelerometerJerk.X.Time : Mean of BodyAccelerometerJerk measured along the X-axis in the time domain.
16. mean.BodyAccelerometerJerk.Y.Time : Mean of BodyAccelerometerJerk measured along the Y-axis in the time domain.
17. mean.BodyAccelerometerJerk.Z.Time : Mean of BodyAccelerometerJerk measured along the Z-axis in the time domain.
18. std.BodyAccelerometerJerk.X.Time : Std of BodyAccelerometerJerk measured along the X-axis in the time domain.
19. std.BodyAccelerometerJerk.Y.Time : Std of BodyAccelerometerJerk measured along the Y-axis in the time domain.
20. std.BodyAccelerometerJerk.Z.Time : Std of BodyAccelerometerJerk measured along the Z-axis in the time domain.
21. mean.BodyGyroscope.X.Time : Mean of BodyGyroscope measured along the X-axis in the time domain.
22. mean.BodyGyroscope.Y.Time : Mean of BodyGyroscope measured along the Y-axis in the time domain.
23. mean.BodyGyroscope.Z.Time : Mean of BodyGyroscope measured along the Z-axis in the time domain.
24. std.BodyGyroscope.X.Time : Std of BodyGyroscope measured along the X-axis in the time domain.
25. std.BodyGyroscope.Y.Time : Std of BodyGyroscope measured along the Y-axis in the time domain.
26. std.BodyGyroscope.Z.Time : Std of BodyGyroscope measured along the Z-axis in the time domain.
27. mean.BodyGyroscopeJerk.X.Time : Mean of BodyGyroscopeJerk measured along the X-axis in the time domain.
28. mean.BodyGyroscopeJerk.Y.Time : Mean of BodyGyroscopeJerk measured along the Y-axis in the time domain.
29. mean.BodyGyroscopeJerk.Z.Time : Mean of BodyGyroscopeJerk measured along the Z-axis in the time domain.
30. std.BodyGyroscopeJerk.X.Time : Std of BodyGyroscopeJerk measured along the X-axis in the time domain.
31. std.BodyGyroscopeJerk.Y.Time : Std of BodyGyroscopeJerk measured along the Y-axis in the time domain.
32. std.BodyGyroscopeJerk.Z.Time : Std of BodyGyroscopeJerk measured along the Z-axis in the time domain.
33. mean.BodyAccelerometer.Magnitude.Time : Mean of BodyAccelerometer measured by magnitude in the time domain.
34. std.BodyAccelerometer.Magnitude.Time : Std of BodyAccelerometer measured by magnitude in the time domain.
35. mean.GravityAccelerometer.Magnitude.Time : Mean of GravityAccelerometer measured by magnitude in the time domain.
36. std.GravityAccelerometer.Magnitude.Time : Std of GravityAccelerometer measured by magnitude in the time domain.
37. mean.BodyAccelerometerJerk.Magnitude.Time : Mean of BodyAccelerometerJerk measured by magnitude in the time domain.
38. std.BodyAccelerometerJerk.Magnitude.Time : Std of BodyAccelerometerJerk measured by magnitude in the time domain.
39. mean.BodyGyroscope.Magnitude.Time : Mean of BodyGyroscope measured by magnitude in the time domain.
40. std.BodyGyroscope.Magnitude.Time : Std of BodyGyroscope measured by magnitude in the time domain.
41. mean.BodyGyroscopeJerk.Magnitude.Time : Mean of BodyGyroscopeJerk measured by magnitude in the time domain.
42. std.BodyGyroscopeJerk.Magnitude.Time : Std of BodyGyroscopeJerk measured by magnitude in the time domain.
43. mean.BodyAccelerometer.X.Frequency : Mean of BodyAccelerometer measured along the X-axis in the frequency domain.
44. mean.BodyAccelerometer.Y.Frequency : Mean of BodyAccelerometer measured along the Y-axis in the frequency domain.
45. mean.BodyAccelerometer.Z.Frequency : Mean of BodyAccelerometer measured along the Z-axis in the frequency domain.
46. std.BodyAccelerometer.X.Frequency : Std of BodyAccelerometer measured along the X-axis in the frequency domain.
47. std.BodyAccelerometer.Y.Frequency : Std of BodyAccelerometer measured along the Y-axis in the frequency domain.
48. std.BodyAccelerometer.Z.Frequency : Std of BodyAccelerometer measured along the Z-axis in the frequency domain.
49. mean.BodyAccelerometerJerk.X.Frequency : Mean of BodyAccelerometerJerk measured along the X-axis in the frequency domain.
50. mean.BodyAccelerometerJerk.Y.Frequency : Mean of BodyAccelerometerJerk measured along the Y-axis in the frequency domain.
51. mean.BodyAccelerometerJerk.Z.Frequency : Mean of BodyAccelerometerJerk measured along the Z-axis in the frequency domain.
52. std.BodyAccelerometerJerk.X.Frequency : Std of BodyAccelerometerJerk measured along the X-axis in the frequency domain.
53. std.BodyAccelerometerJerk.Y.Frequency : Std of BodyAccelerometerJerk measured along the Y-axis in the frequency domain.
54. std.BodyAccelerometerJerk.Z.Frequency : Std of BodyAccelerometerJerk measured along the Z-axis in the frequency domain.
55. mean.BodyGyroscope.X.Frequency : Mean of BodyGyroscope measured along the X-axis in the frequency domain.
56. mean.BodyGyroscope.Y.Frequency : Mean of BodyGyroscope measured along the Y-axis in the frequency domain.
57. mean.BodyGyroscope.Z.Frequency : Mean of BodyGyroscope measured along the Z-axis in the frequency domain.
58. std.BodyGyroscope.X.Frequency : Std of BodyGyroscope measured along the X-axis in the frequency domain.
59. std.BodyGyroscope.Y.Frequency : Std of BodyGyroscope measured along the Y-axis in the frequency domain.
60. std.BodyGyroscope.Z.Frequency : Std of BodyGyroscope measured along the Z-axis in the frequency domain.
61. mean.BodyAccelerometer.Magnitude.Frequency : Mean of BodyAccelerometer measured by magnitude in the frequency domain.
62. std.BodyAccelerometer.Magnitude.Frequency : Std of BodyAccelerometer measured by magnitude in the frequency domain.
63. mean.BodyBodyAccelerometerJerk.Magnitude.Frequency : Mean of BodyBodyAccelerometerJerk measured by magnitude in the frequency domain.
64. std.BodyBodyAccelerometerJerk.Magnitude.Frequency : Std of BodyBodyAccelerometerJerk measured by magnitude in the frequency domain.
65. mean.BodyBodyGyroscope.Magnitude.Frequency : Mean of BodyBodyGyroscope measured by magnitude in the frequency domain.
66. std.BodyBodyGyroscope.Magnitude.Frequency : Std of BodyBodyGyroscope measured by magnitude in the frequency domain.
67. mean.BodyBodyGyroscopeJerk.Magnitude.Frequency : Mean of BodyBodyGyroscopeJerk measured by magnitude in the frequency domain.
68. std.BodyBodyGyroscopeJerk.Magnitude.Frequency : Std of BodyBodyGyroscopeJerk measured by magnitude in the frequency domain.
