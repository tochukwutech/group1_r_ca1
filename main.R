# ==========================================
# GROUP 1: STUDENT ACADEMIC PERFORMANCE
# ==========================================

# SECTION 1: Import and inspect the dataset
# Ayo's part

## Task a: data import and inspection
student_data <- read.csv("student_performance.csv")
head(student_data)
names(student_data)
str(student_data)
dim(student_data)

# SECTION 2: Handle Missing Values
# Gbolahon's part
 student_data$Test_Score[student_data$Student == "Femi"] <- NA
 sum(is.na(student_data$Test_Score))
 mean(student_data$Test_Score, na.rm = TRUE)

# SECTION 3: Create Adjusted_Score
# Anthony's part

student_data$Adjusted_Score <- student_data$Test_Score + 5
student_data[ , c("Student", "Test_Score", "Adjusted_Score")]

# SECTION 4: Create Conditional Logic to Determine Pass or Fail
# Chifumnaya's part

student_data$Result <- ifelse(student_data$Test_Score >= 50, "Pass", "Fail")
head(student_data)
table(student_data$Result)

# SECTION 5: Determine Eligibility
# Tunmilara's part

student_data$Eligible <- student_data$Attendance >= 75 & student_data$Test_Score >= 50
student_data[, c("Student", "Attendance", "Test_Score", "Eligible")]
table(student_data$Eligible)


# SECTION 6: Analyse Student Performance
# Folarin's part


# SECTION 7: Interpret the Results
# Miracle's part


# SECTION 8: Validate and Export the Dataset
# Dahunsi's part