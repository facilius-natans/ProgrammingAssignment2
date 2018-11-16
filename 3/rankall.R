rankall <- function(outcome, num = "best") {
  
  # Map argument to column_name
  source("outcome_switch.R")
  column_name <- outcome_switch(outcome)
  
  # Error handling
  if (column_name == "NA") {
    return(column_name)
  }
  
  # Read file
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # Select the required columns: Hospital.Name, State, and the column name with desired outcome
  df <- df[, c("Hospital.Name", "State", column_name)]
  
  # Format NAs
  df[, column_name] <- gsub("Not Available", "NA", df[, column_name])
  
  # Cast outcome as numeric
  df[, column_name] <- suppressWarnings(as.numeric(df[, column_name]))
  
  # Sort data  by state, outcome, and hospital name
  df <- df[order(df$"State", df[column_name], df$"Hospital.Name", na.last=NA),]
  
  # Group data by state
  list_by_state <- split(df[,c("Hospital.Name")], df$State)
  
  # Function to rank hospitals in each state
  rank_hospitals <- function(state_set, num){
    if (num == "best") {
      result <- head(state_set, 1)
    }
    else if (num == "worst") {
      #
    }
    else {
      #
    }  
  }
  
  # Condition based on num
  if (num == "best") {
    #
  }
  else if (num == "worst") {
    #
  }
  else {
    #
  }
  
  result <- lapply(list_by_state, rank_hospitals, num)
  result <- data.frame(hospital = unlist(result), state = names(result), row.names = names(result))
  
  return(result)
  
  library(dplyr)
  if (outcome == "pneumonia") {
    test <- df %>% 
      group_by(State) %>%
      summarize(result = min(as.numeric(pneumonia), na.rm = TRUE)) %>%
      arrange((State))
    print(test)
  }
  
}

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
          
  
  