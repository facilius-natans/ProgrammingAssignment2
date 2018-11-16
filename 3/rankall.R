rankall <- function(outcome, num){
  
  # Map argument to column_name
  
  source("outcome_switch.R")
  column_name <- outcome_switch(outcome)
  
  # Error handling
  
  if (column_name == "NA") {
    return(column_name)
  }
  
  #read file
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # Select the required columns: Hospital.Name, State, and the column name with desired outcome
  
  df <- df[, c("Hospital.Name", "State", df$outcome)]
  
  return(column_name)
  
  library(dplyr)
  if (outcome == "pneumonia") {
    test <- df %>% 
      group_by(State) %>%
      summarize(result = min(as.numeric(pneumonia), na.rm = TRUE)) %>%
      arrange((State))
    print(test)
  }
  
}

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
          
  
  