
best <- function(state, outcome_name){
  
  column_name <- switch(outcome_name,
         "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
         "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
         "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  
  outcome <- read.csv("outcome-of-care-measures.csv",  colClasses = "character")
  
  # Select three required columns: Hospital.Name, State, and column name selected based on the outcome_name param
  new_outcome <- outcome[, c("Hospital.Name", "State", column_name)]
  
  # Select specified State
  new_outcome <- subset(new_outcome, new_outcome[,"State"] == state)

  # Get lowest rate for specified outcome
  col_name_min <- apply(new_outcome, 2, min)
  
  # Remove column name from outcome, and return it
  unname(col_name_min['Hospital.Name'])
}