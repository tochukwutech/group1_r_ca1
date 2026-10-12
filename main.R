# ==========================================
# GROUP 1: STUDENT ACADEMIC PERFORMANCE
# ==========================================

# SECTION 1: Import and inspect the dataset
# Ayo's part

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


# SECTION 2: Create Adjusted_Score
# Anthony's part


# SECTION 3: Determine Pass or Fail
# Chifumnanya's part


# SECTION 4: Determine Eligibility
# Tunmilara's part
student_data$Eligible <- student_data$Attendance >= 75 & student_data$Test_Score >= 50

student_data[ c("Student", "Attendance", "Test_Score", "Eligible")]
table(student_data$Eligible)

# SECTION 5: Handle Missing Values
# Gbolahon's part


# SECTION 6: Analyse Student Performance
# Folarin's part


# SECTION 7: Interpret the Results
# Miracle's part


# SECTION 8: Validate and Export the Dataset
# Dahunsi's part