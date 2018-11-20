outcome_switch <- function(outcome){
  #read file
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  column_name <-switch(outcome,
                       "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                       "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                       "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",
                       "NA")
  column_name
}