input_df <- read.csv("short_outcome.csv",  colClasses = "character")
#print(test)
#names(test)[5]<-c"heart failure"
#print(input_df)

setnames(input_df, old = c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
               "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"),
               new = c("heart failure", "heart attack", "pneumonia")
)


pneumonia_min <- min(as.numeric(input_df$pneumonia))
#print(pneumonia_min)
pneumonia_sort <- sort(as.numeric(input_df$pneumonia))
print(pneumonia_sort)
rank_result <- pneumonia_sort[9]
print(rank_result)

input_df$"heart attack" <- gsub("Not Available", "NA", input_df$"heart attack")
heart_attack_col <- as.numeric(input_df$"heart attack")
#heart_attack_max <- max(input_df$"heart attack", na.rm=TRUE)
print(heart_attack_col)
heart_attack_min <- min(as.numeric(input_df$"heart attack"), na.rm=TRUE)
print(heart_attack_min)
#heart_failure_min <- max(input_df [, "heart failure"], na.rm = FALSE)
#pneumonia_min <-  setorderv(input_df, input_df[,"pneumonia"], 0)
#heart_attack_min <- min(input_df[["heart attack"]], na.rm = FALSE)
#col_name_min <- apply(test, 2, min)
#print(col_name_min)
#col_name_max <- apply(test, 2, max)
#print(col_name_max)
#print(pneumonia_min)
#print(heart_failure_min)
#print(heart_attack_min)
hospital_row <- subset(input_df, input_df[,"pneumonia"] == rank_result)
print(hospital_row)
result <- unname(hospital_row['Hospital.Name'])
print(result)
