# ==========================================
# GROUP 1: STUDENT ACADEMIC PERFORMANCE
# ==========================================

# SECTION 1: Import and inspect the dataset
# Ayo's part

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

highest_score_index <- which.max(student_data$Test_Score)
top_student_name <- student_data$Student[highest_score_index]
highest_score <- student_data$Test_Score[highest_score_index]
cat("The student with the highest test score is: ", top_student_name, "(Score:", highest_score, ")\n")

passed_students <- sum(student_data$Result == "Pass", na.rm = TRUE)
cat("The number of students who passed:", passed_students, "\n")

eligible_students <- sum(student_data$Eligible, na.rm = TRUE)
cat("The number of eligible students:", eligible_students, "\n")


# SECTION 7: Interpret the Results
# Miracle's part <- inside 'documentation.md'

# Observations and Interpretation
# Based on Folarin's analysis results.

# Observation 1:
# Chidi has the highest recorded test score, which is 85.
# Chidi also has 92% attendance.
# Since the score is at least 50 and attendance is at least 75%,
# Chidi passes and is eligible.

# Observation 2:
# The analysis reports 4 students who passed and 4 who are eligible.
# These students are Ada, Chidi, Esther, and Hassan.
# Ada: test score 72, attendance 85%.
# Chidi: test score 85, attendance 92%.
# Esther: test score 67, attendance 80%.
# Hassan: test score 76, attendance 88%.
# Each student meets BOTH the score and attendance requirements.
# Therefore, all four confirmed passing students are also eligible.

# Missing-value explanation:
# The question requires Femi's test score to be changed to NA.
# NA means the score is missing; it does not mean zero or failure.
# Femi's attendance is 75%, but a missing score cannot confirm
# whether Femi passed or is eligible.

# Conclusion limit:
# These observations describe the supplied students.
# They do not prove that higher attendance causes higher scores.

# SECTION 8: Validate and Export the Dataset
# Dahunsi's part
# Store the processed dataset

processed_data <- student_data

# Check that all required columns exist
required_columns <- c("Student", "Age", "Attendance", "Test_Score", "Adjusted_Score", "Result", "Eligible")
missing_cols <- setdiff(required_columns, names(processed_data))

if (length(missing_cols) == 0) {
  message("PASS: All required columns are present.")
} else {
  stop(
    "FAIL: Missing columns: ",
    paste(missing_cols, collapse = ", ")
  )
}
output_file <- "student_performance_processed.csv"
write.csv(processed_data, output_file, row.names = FALSE)
if (!file.exists(output_file)) {
  stop("FAIL: Processed CSV was not created.")
}
message("PASS: ", output_file, " exported successfully.")
exported <- read.csv(output_file)
if (identical(names(exported), names(processed_data)) && nrow(exported) == nrow(processed_data) && isTRUE(all.equal(exported, processed_data, check.attributes = FALSE))) {
  message("PASS: Exported data matches the processed data.")
} 
else {
  stop("FAIL: Exported data differs from the processed data.")
}
str(exported)
head(exported)