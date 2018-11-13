
best <- function(state, outcome_name){
  
  column_name <- switch(outcome_name,
         "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
         "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
         "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",
         "NA")
  
  # handle errors
  if (column_name == "NA") {
    return(column_name)
  }
  if (match(state, state.abb, nomatch = FALSE) == 0) {
    stop("Invalid State")
  }
  
  df <- read.csv("outcome-of-care-measures.csv",  colClasses = "character")
  
  # Select three required columns: Hospital.Name, State, and column name selected based on the outcome_name param
  df <- df[, c("Hospital.Name", "State", column_name)]
  
  # Select specified State
  df <- subset(df, df[,"State"] == state)

  # Get lowest rate for specified outcome
  df[, column_name] <- gsub("Not Available", "NA", df[, column_name])
  col_name_min <- min(as.numeric(df[, column_name]), na.rm = TRUE)

  # Select the row corresponding to the found value
  result_row <- subset(df, df[, column_name] == col_name_min)
  # Remove column label
  result_hospital <- unname(result_row[1, 'Hospital.Name'])
}