pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        dfs <- data.frame()
        
        for(i in id) {
                filepath <- paste(directory, paste(formatC(i, width = 3, flag = "0"), ".csv", sep=""), sep="/")
                
                df <- read.csv(filepath)
                
                dfs <- rbind(dfs, df)
        }
        
        mean(dfs[[pollutant]], na.rm = TRUE)
}