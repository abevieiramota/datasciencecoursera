corr <- function(directory, threshold = 0) {
        
        result <- numeric()
        
        for(filename in dir(directory)) {
                filepath <- paste(directory, filename, sep="/")
                
                df <- read.csv(filepath)
                
                ncomplete <- sum(complete.cases(df))
                
                if(ncomplete > threshold) {
                
                        dfcor <- cor(df$nitrate, df$sulfate, use = "complete.obs")
                        
                        result <- c(result, dfcor)
                }
        }
        
        result
}