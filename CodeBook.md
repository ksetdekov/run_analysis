# Codebook #
This is the file that describes:
* The variables,
Variables in the _result.txt_ can be broken down into 3 sections
  1. _subject_, integer from  1 to 30, being an ID for test subjects
  2. _activity_, string variable with 6 possible values (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
  3. 66 variables that come from the original data set and have either a std() or mean() in their name
* the data, 
 _subject_ (n=30) and _activity_ (n=6) provide 180 possible combinations. 
 There are 180 rows, for which all of the remaining  columns carry an average value for a particular _subject_ and _activity_ combination 
* transformations or work  performed to clean up the data
  * test and train data has been unified
  * unused columns were deleted
  * column names were added
  * variable for _subject_ and _activity_ were created
  * In more detail this is listed in _README.MD_ 
