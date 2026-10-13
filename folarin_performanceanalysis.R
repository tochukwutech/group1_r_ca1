# performance analysis

highest_score_index <- which.max(student_data$Test_Score)
top_student_name <- student_data$Name[highest_score_index]
highest_score <- student_data$Test_Score[highest_score_index]

cat("The student with the highest test score is: ", top_student_name, "(Score:", highest_score, ")\n")

passed_students <-sum(student_data$Result == "Passed", na.rm = TRUE)

cat("The number of students who passed:", passed_students, "\n")

eligible_students <-sum(student_data$Eligible, na.rm = TRUE)

cat("The number of eligible students:", eligible_students, "\n")