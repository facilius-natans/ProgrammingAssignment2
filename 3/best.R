
best <- function(state, outcome_name){
  
column_name <- switch(outcome_name,
         "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
         "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
         "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  
  
  outcome <- read.csv("outcome-of-care-measures.csv",  colClasses = "character")
  #get columns  "Hospital.Name", "Specified outcome", one of "heart attack", 
  #"heart failure", or "pneumonia", and "30-day mortality rate for specified outcome"
 
   new_outcome <- outcome[, c("Hospital.Name", "State", column_name)]
   
   new_outcome <- subset(new_outcome, new_outcome[,"State"] == state)
 
    #print(head(new_outcome))
    
    col_name_min <- apply(new_outcome, 2, min)
    # remove column name from outcome
    unname(col_name_min['Hospital.Name'])
  #get lowest rate for specified outcome
}

# head(outcome)
#ncol(outcome)
#nrow(outcome)
#names(outcome)
#outcome[, 11] <- as.numeric(outcome[, 11])
#hist(outcome[, 11])