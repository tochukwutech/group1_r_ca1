## Task a: data import and inspection

#import the data set / storing in an R object
student_data <- read.csv("student_performance.csv")

# Displaying first few observations
head(student_data)

# display column name and data structure
names(student_data)

str(student_data)

#dim to show the number of rows and col
dim(student_data)
