df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

valid_states <- unique(df[, 7])
valid_outcomes <- c("heart attack", "heart failure", "pneumonia")

idxs_outcome = list("heart attack" = 11,
                   "heart failure" = 17,
                   pneumonia = 23)

for (idx in idxs_outcome){
        df[, idx] <- as.numeric(df[, idx])
}

idx_hospital <- 2
idx_state <- 7

best <- function(state, outcome) {
        
        # validate input
        if (!(state %in% valid_states)) {
                stop("invalid state")
        }
        
        if(!(outcome %in% valid_outcomes)) {
                stop("invalid outcome")
        }
        
        # calculate best hospital
        
        state_df <- df[df[, 7] == state,]
        idx_outcome <- as.numeric(idxs_outcome[outcome])
        # removes NAs hospitals
        state_df <- state_df[!is.na(state_df[, idx_outcome]), ]
        
        state_df[order(state_df[, c(idx_outcome, idx_hospital)]), 2][1]
}