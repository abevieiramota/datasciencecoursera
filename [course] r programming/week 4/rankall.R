df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

valid_states <- unique(df[, 7])
valid_outcomes <- c("heart attack", "heart failure", "pneumonia")

idxs_outcome = list("heart attack" = 11,
                    "heart failure" = 17,
                    pneumonia = 23)

valid_nums <- c("best", "worst")

for (idx in idxs_outcome){
        df[, idx] <- as.numeric(df[, idx])
}

idx_hospital <- 2
idx_state <- 7
        
rankall_ <- function(state, idx_outcome, num) {
        
        state_df <- df[df[, idx_state] == state, ]
        
        # removes NAs hospitals
        state_df <- state_df[!is.na(state_df[, idx_outcome]), ]
        
        n_hospitals <- nrow(state_df)
        
        sorted_state_df <- state_df[order(state_df[, idx_outcome],
                                          state_df[, idx_hospital]), idx_hospital]
        
        if(is.numeric(num)){
                if(num > n_hospitals) {
                        return(NA)
                }
        } else {
                if(!(num %in% valid_nums)) {
                        return(NA)
                }
        }
        
        if(num == "best") {
                return(sorted_state_df[1])
        }
        
        if(num == "worst") {
                return(tail(sorted_state_df, n = 1))
        }
        
        sorted_state_df[num:num]
}

rankall <- function(outcome, num = "best") {
        
        if(!(outcome %in% valid_outcomes)) {
                stop("invalid outcome")
        }
        
        idx_outcome <- as.numeric(idxs_outcome[outcome])
        
        r <- mapply(rankall_, valid_states, idx_outcome, num)
        
        d <- data.frame(list(hospital = r, state = names(r)))
        
        d[order(d$state), ]
}