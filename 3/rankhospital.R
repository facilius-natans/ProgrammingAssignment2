
rankhospital <- function(state, outcome, num){
   column_name <-switch(outcome,
         "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
         "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
         "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",
          "NA")
  
  if (column_name == "NA") {
    return(column_name)
  }
  if (match(state, state.abb, nomatch = FALSE) == 0) {
    stop("Invalid State")
  }
  
  input_df <- read.csv("outcome-of-care-measures.csv",  colClasses = "character")
  
  # Select the required columns: Hospital.Name, State, and the column name selected based on the outcome_name param
  input_df <- input_df[, c("Hospital.Name", "State", column_name)]

  # Select specified State
  input_df <- subset(input_df, input_df[,"State"] == state)
  # Format NAs
  input_df[, column_name] <- gsub("Not Available", "NA", input_df[, column_name])
  
  if (num == "best") {
    result <- min(as.numeric(input_df[, column_name]), na.rm = TRUE)
  } else if (num == "worst") {
    result <- max(as.numeric(input_df[, column_name]), na.rm = TRUE)
  } else {
    # Sort by the value specified in the outcome param
    outcome_sort <- sort(as.numeric(input_df[, column_name]))
    # Make sure the row specified in the num param exists
    if (length(outcome_sort) < num) {
      return("NA")
    }
    # Select the outcome value of the specified rank
    result <- outcome_sort[num]
  }

  # Select the row corresponding to the found value
  result_row <- subset(input_df, input_df[, column_name] == result)
  # Remove column label
  result_hospital <- unname(result_row[1, 'Hospital.Name'])
  
  
  print(result_hospital)
  result_hospital
}
