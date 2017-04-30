complete <- function(directory, id = 1:322) {
        
        result <- data.frame(id = id, nobs = numeric(length(id)))
        
        for(i in id) {
                filepath <- paste(directory, paste(formatC(i, width = 3, flag = "0"), ".csv", sep=""), sep="/")
                
                df <- read.csv(filepath)
                
                result[[result$id == i, 'nobs']] <- sum(complete.cases(df))
        }
        
        result
}