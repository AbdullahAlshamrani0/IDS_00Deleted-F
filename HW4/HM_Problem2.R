#Q1 : read the nutrition dataset
df <- read.table("C:\\Users\\MASROUR\\pyproj\\my_env\\basedata\\HW\\HM3\\nutrition_subset.txt",sep = ",",
                 header = TRUE,na.strings = "?")
df

#Q3 Sort the data set by saturated_ fat and produce a listing of the five food items
#highest in saturated fat. 
#Comment on the validity of comparing fooditems of different sizes.
install.packages("dyplyr")
library(dplyr)
sorting <-df[order(-df$saturated_fat),] #sort data in ascending order
head(sorting,n=5L) #listing the five food items highest in saturated fat

#Q4. Create a new variable, saturated_ fat_ per_gram, by dividing the amount of 
#saturated fat by the weight in grams. Sort the data set by saturated_ fat_ per_gram 
#and produce a listing of the five food items highest 
#in saturated fat per gram. Which food has the most saturated fat per gram?
attach(df)
df<-df %>% # Create a new variable "saturated_fat_per_gram
  mutate(saturated_fat_per_gram = saturated_fat/weight_in_grams)
head(df)
sorting2 <-df[order(-df$saturated_fat_per_gram),] #sort data in ascending order
head(sorting2,n=5L) #listing the five food items highest in saturated_fat_per_gram
#the food who has the most saturated fat per gram is "BUTTER; SALTED 1 TBSP"

#Q5. Standardize (zero mean) the field saturated_ fat_ per_gram, 
#and produce a listing of all the food items that are outliers at the high 
#end of the scale. How many food items are outliers at the low end of the scale?
#Create a density plot for saturated_ fat_ per_gram

Convert_df<-scale(df$saturated_fat_per_gram) 
Convert_df #Standardize (zero mean) the saturated_fat_per_gram variable

boxplot(Convert_df) ## There are a lot of outliers at the high end of the scale,
                      ##and there is any outlier at the low end of the scale.

d <- density(df$saturated_fat_per_gram) # returns the density data
plot(d) # plots the results

#Q6. Are there any missing values? If so, 
#impute as necessary and explain your approach.

sum(is.na(df)) # The sum is equal to zero,
              #then, we don't have any missing value

#Q7. Standardize (zero mean) the numeric variables, 
#and determine if there are any outliers

num_var<-df %>% dplyr::select(where(is.numeric))#select numeric variables
num_var
scale_df<-scale(num_var) #Standardize (zero mean) the numeric variables
head(scale_df)

boxplot(scale_df)## check outliers : we have many outliers in
                #our dataset for all of numeric variables (see circles)

#Q8. Summarize your findings
#In this section, We learned how to add a column, 
#and we did the standardization for numeric variables, 
#check if there are outliers or missing values as well
