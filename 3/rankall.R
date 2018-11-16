rankall <- function(outcome, num){
  
  
  #read file
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  column_name <-switch(outcome,
                       "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                       "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                       "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",
                       "NA")
  
  
  
  
  # Select the required columns: Hospital.Name, State, and the column name with desired outcome
  
  df <- df[, c("Hospital.Name", "State", df$outcome)]
  
  
  
  library(dplyr)
  if (outcome == "pneumonia") {
    test <- df %>% 
      group_by(State) %>%
      summarize(result = min(as.numeric(pneumonia), na.rm = TRUE)) %>%
      arrange((State))
    print(test)
  }
  
}

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
          
  
  