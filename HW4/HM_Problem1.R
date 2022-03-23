getwd()
#Q1 : Read the datset

df <- read.table("C:\\Users\\MASROUR\\pyproj\\my_env\\basedata\\HW\\HM3\\adult_training.txt",sep = ",",
                 header = TRUE,na.strings = "?")
df

#Q2. Create a contingency table of workclass and sex, and plot it.
attach(df)
cross_tab<-table(workclass,sex)
cross_tab # contingency table
plot(cross_tab) #plot

#Q3. Create a contingency table of sex and marital status, and plot it
cross_tab1<-table(sex,marital_status)
cross_tab1 # contingency table
plot(cross_tab1) #plot

#Q4. Create a new data frame, adultOver40, for those whose age > 40.
adultOver40 <- subset(df, age > 40)
adultOver40

#Q5. Recreate the contingency table of sex and marital status for adultOver40
cross_tab2<-table(adultOver40$sex,adultOver40$marital_status)
cross_tab2 # contingency table
plot(cross_tab2) #plot

#Q6. Determine whether any outliers exist for the education field.
#We will plot a boxplot to check the outliers
boxplot(adultOver40$education)

#Q7. Standardize (zero mean) the age variable, and identify 
#how many outliers there are. What is the most extreme outlier?

Converted_df<-scale(df$age) #Standardize (zero mean) the age variable
Converted_df

boxplot(Converted_df)## check for the outliers, 
                      #the  circles indicates a lot of outliers

#Q8. Age anomaly? Select only records with age at least 80, 
#and construct a histogram of age. Explain what you see.
adultOver80 <- subset(df, age >= 80)
adultOver80

boxplot(adultOver40$age) # We notice many outliers 

hist(adultOver80$age)#plot the histogram of age
## We notice that most of individuals have an age between [80,82] and [88,90]

#Q9. Summarize your findings.

#In this section we learned how to build a contengency table and plot it,
#we are now familiar with data extraction and standardization of numeric variables