# R Programming Project: Student Academic Performance \& Attendance Analysis

**Group:** Group 1

**Project Topic:** Student Academic Performance Analysis

**Data Source:** `student\\\_performance.csv`

**Output File:** `student\\\_performance\\\_processed.csv`



## 1\. Project Executive Summary

The objective of this project is to analyze student academic performance and attendance records using the R programming language. By utilizing base R functions, data manipulation techniques, conditional logic, missing value handling, automated statistical summaries, results interpretation, and dataset validation/exporting, the program processes raw student data to generate actionable insights regarding pass rates, student eligibility, and academic standing.



## 2\. Detailed Technical Breakdown \& R Concepts Used

### A. Data Import and Inspection (Ayo's part)

* **Concepts Used:** File I/O, Data Frames, Structure Inspection.
* **R Functions:** `read.csv()`, `head()`, `names()`, `str()`, `dim()`
* **Implementation \& Explanation:**
* `read.csv("student\\\_performance.csv")`: Imports the comma-separated values file into R as a data frame object.
* `head()`: Displays the first few rows of the dataset to verify structure.
* `names()`: Extracts and lists all variable (column) names.
* `str()`: Displays the internal structure of the data frame, detailing data types.
* `dim()`: Returns the exact dimensions (number of rows and columns) of the dataset.



### B. Missing Value Management (Gbolahon's part)

* **Concepts Used:** Logical Indexing, Missing Value (`NA`) Assignment, Summary Functions.
* **R Functions:** `is.na()`, `sum()`, `mean()` with `na.rm = TRUE`
* **Implementation \& Explanation:**
* Assigns an `NA` value conditionally (`student\\\_data$Test\\\_Score\\\[student\\\_data$Student == "Femi"] <- NA`).
* `sum(is.na(...))`: Counts total missing values in a column.
* `mean(..., na.rm = TRUE)`: Computes summary statistics while explicitly ignoring missing values.



### C. Data Transformation \& Computation (Anthony's part)

* **Contribution Overview:** Added 5 marks to everyone's score in the test score column and stored it in a new column called `Adjusted\\\_Score` without altering the original `Test\\\_Score` column. Then displayed selected columns to verify the calculation went through successfully.
* **R Concepts Used:**
1. **Dataframes:** Working with the student table data frame structure.
2. **`$` operator:** Used to access the test score column and create the new `Adjusted\\\_Score` column.
3. **`<-` assignment operator:** Used to assign the calculated values to the new column.
4. **`+` arithmetic operator:** Used to add 5 marks to each score.
5. **Vectorized operations:** Applying addition to all values in the test score column at once without looping.
6. **Column selection and indexing:** Using `student\\\_data\\\[, c("Student", "Test\\\_Score", "Adjusted\\\_Score")]` to display only the necessary columns.
7. **`c()` function:** Used to combine column names into a vector so that multiple columns can be selected together.



### D. Conditional Logic (Chifumnaya's part)

* **Concepts Used:** Control Structures, Vectorized Conditionals, Frequency Counting.
* **R Functions:** `ifelse()`, `table()`
* **Implementation \& Explanation:**
* Creates a categorical variable `Result` evaluating whether a student passed (`Test\\\_Score >= 50`).
* `table()`: Generates a frequency summary of results.



### E. Logical Operations (Tunmilara's part)

* **Concepts Used:** Boolean Logic, Compound Conditions.
* **R Operators:** Logical AND (`\\\&`), Comparison operators (`>=`)
* **Implementation \& Explanation:**
* Evaluates dual conditions for student eligibility (`Attendance >= 75 \\\& Test\\\_Score >= 50`).
* Outputs a logical boolean column (`Eligible`).



### F. Performance Analysis (Folarin's part)

* **Concepts Used:** Index Location, Aggregate Counting, Console Reporting.
* **R Functions:** `which.max()`, `sum()`, `cat()`
* **Implementation \& Explanation:**
* `which.max()` and indexing find the top-performing student and their highest score.
* Uses conditional counting (`sum(..., na.rm = TRUE)`) to tally total passes and eligible students.



### G. Results Interpretation (Miracle's part)

* **Concepts Used:** Analytical Evaluation, Missing Value Awareness.
* **Implementation \& Explanation:**
* Synthesizes performance insights from student records (e.g., aligning attendance and test scores to confirm passes).
* Accounts for missing values (`NA`), recognizing that missing scores preclude final eligibility verification.



### H. Validation and Export (Dahunsi's part)

* **Concepts Used:** Error Handling, Data Export, Integrity Verification.
* **R Functions:** `setdiff()`, `stop()`, `message()`, `write.csv()`, `file.exists()`, `identical()`, `all.equal()`
* **Implementation \& Explanation:**
* Programmatically checks that all required columns exist before writing to disk, halting execution via `stop()` if columns are missing.
* Exports the processed dataset to `student\\\_performance\\\_processed.csv`.
* Reads the file back in and verifies it against the active data frame to guarantee complete data integrity.



\---

## 3\. Master Script Reference (R code)

### ==========================================

### GROUP 1: STUDENT ACADEMIC PERFORMANCE

### ==========================================

### SECTION 1: Import and inspect the dataset

### Ayo's part

student\_data <- read.csv("student\_performance.csv")
head(student\_data)
names(student\_data)
str(student\_data)
dim(student\_data)

### SECTION 2: Handle Missing Values

### Gbolahon's part

student\_data$Test\_Score\[student\_data$Student == "Femi"] <- NA
sum(is.na(student\_data$Test\_Score))
mean(student\_data$Test\_Score, na.rm = TRUE)

### SECTION 3: Create Adjusted\_Score

### Anthony's part

student\_data$Adjusted\_Score <- student\_data$Test\_Score + 5
student\_data\[ , c("Student", "Test\_Score", "Adjusted\_Score")]

### SECTION 4: Create Conditional Logic to Determine Pass or Fail

### Chifumnaya's part

student\_data$Result <- ifelse(student\_data$Test\_Score >= 50, "Pass", "Fail")
head(student\_data)
table(student\_data$Result)

### SECTION 5: Determine Eligibility

### Tunmilara's part

student\_data$Eligible <- student\_data$Attendance >= 75 \& student\_data$Test\_Score >= 50
student\_data\[, c("Student", "Attendance", "Test\_Score", "Eligible")]
table(student\_data$Eligible)

### SECTION 6: Analyse Student Performance

### Folarin's part

highest\_score\_index <- which.max(student\_data$Test\_Score)
top\_student\_name <- student\_data$Student\[highest\_score\_index]
highest\_score <- student\_data$Test\_Score\[highest\_score\_index]
cat("The student with the highest test score is: ", top\_student\_name, "(Score:", highest\_score, ")\\n")

passed\_students <- sum(student\_data$Result == "Pass", na.rm = TRUE)
cat("The number of students who passed:", passed\_students, "\\n")

eligible\_students <- sum(student\_data$Eligible, na.rm = TRUE)
cat("The number of eligible students:", eligible\_students, "\\n")

#### SECTION 7: Interpret the Results

#### Miracle's part

Observations and Interpretation

Based on Folarin's analysis results.

### SECTION 8: Validate and Export the Dataset

### Dahunsi's part

processed\_data <- student\_data

required\_columns <- c("Student", "Age", "Attendance", "Test\_Score", "Adjusted\_Score", "Result", "Eligible")
missing\_cols <- setdiff(required\_columns, names(processed\_data))

if (length(missing\_cols) == 0) {
message("PASS: All required columns are present.")
} else {
stop("FAIL: Missing columns: ", paste(missing\_cols, collapse = ", "))
}

output\_file <- "student\_performance\_processed.csv"
write.csv(processed\_data, output\_file, row.names = FALSE)

if (!file.exists(output\_file)) {
stop("FAIL: Processed CSV was not created.")
}
message("PASS: ", output\_file, " exported successfully.")

exported <- read.csv(output\_file)

if (
identical(names(exported), names(processed\_data)) \&\&
nrow(exported) == nrow(processed\_data) \&\&
isTRUE(all.equal(exported, processed\_data, check.attributes = FALSE))
) {
message("PASS: Exported data matches the processed data.")
} else {
stop("FAIL: Exported data differs from the processed data.")
}

str(exported)
head(exported)

## 

## 4\. Workflow \& Execution Instructions


1. Ensure `student\\\_performance.csv` is placed in your local working directory.
2. Open your group's main R script in RStudio or your text editor.
3. Run the script sequentially from Section 1 through Section 8.
4. Confirm that the validation messages print successfully to your console and that `student\\\_performance\\\_processed.csv` is generated cleanly in your project folder.




