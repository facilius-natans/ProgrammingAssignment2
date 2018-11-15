#rankall <- function(outcome, num){
outcome <- 'pneumonia'
            
            #read file
            df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

            setnames(df,
                       old = c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                       "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                       "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"),
                        new = c("heart_attack" , "heart_failure" , "pneumonia")
                       )

            #column_name <- c("heart attack", "heart failure", "pneumonia")
             #df$"heart_attack" <- as.numeric((df$"heart_attack"))
             #df$"heart_failure" <- as.numeric((df$heart_failure))
             #df$"pneumonia" <- as.numeric((df$"pneumonia"))
             
             
             # Select the required columns: Hospital.Name, State, and the column name with desired outcome
  
            #df <- df[, c("Hospital.Name", "State", "heart_failure")]
            #print(head(df))
            
            # df_group_by_state <- group_by(df, "State")
            # print(df_group_by_state)
            library(dplyr)
            if (outcome == 'pneumonia') {
            test <- df %>% 
              group_by(State) %>%
              summarize(result = min_rank(as.numeric(pneumonia), na.rm = TRUE)) %>%
              arrange((State))
            print(test)
            }
            
           # new_df<- lapply(df_group_by_state[order(df_group_by_state$"heart failure")])
           # print(new_df)
  
  
  # if (num == "best") {
  #   result <- min(as.numeric(input_df[, column_name]), na.rm = TRUE)
  # } else if (num == "worst") {
  #   result <- max(as.numeric(input_df[, column_name]), na.rm = TRUE)
  # } else {
  #   # Sort by the value specified in the outcome param
  #   outcome_sort <- sort(as.numeric(input_df[, column_name]))
  #   # Make sure the row specified in the num param exists
  #   if (length(outcome_sort) < num) {
  #     return("NA")
  #   }
  #   # Select the outcome value of the specified rank
  #   result <- outcome_sort[num]
  # }
  # 
  # Select the row corresponding to the found value
#   result_row <- subset(input_df, input_df[, column_name] == result)
#   # Remove column label
#   result_hospital <- unname(result_row[1, 'Hospital.Name'])
#   
#   
#   print(result_hospital)
#   result_hospital
# }
