add <- function(x, y) {
        print(x)
        x + y
}

above10 <- function(x) {
        x[x > 10]
}

above <- function(x, n = 10) {
        x[x > n]
}

columnmean <- function(y, removeNA = TRUE) {
        nc <- ncol(y)
        means <- numeric(nc)
        for(i in 1:nc) {
                means[i] <- mean(y[, i], na.rm = removeNA)
        }
        
        means
}

f <- function(f) {
        f("oi")
}

donothing <- function(a) {
        "oi"
}

meuvetor <- function(...) {
        c(...)
}

make.power <- function(n) {
        pow <- function(x) {
                x^n
        }
        pow
}