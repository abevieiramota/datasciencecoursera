makeCacheMatrix <- function(m = matrix()) {
        get <- function() m
        set <- function(mm) {
                m <<- mm
                im <<- NULL
        }
        getinverse <- function() im
        setinverse <- function(imm) im <<- imm
        
        list(set = set,
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

cacheSolve <- function() {}