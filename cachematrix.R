## Put comments here that give an overall description of what your
## functions do

## function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        n <- NULL
        set <- function(y) {
                x <<- y
                n <<- NULL 
        }
        get <- function() x
        setInverse <- function(inverse)n <<-inverse
        getInverse <- function()n
        list(set=set, 
             get=get, 
             setInverse=setInverse,
             getInverse=getInverse)
}


## function computes the inverse of the special matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        n <- x$getInverse()
        if(!is.null(n)){
                message("getting cached data")
                return(n)
        }
        matrix <- x$get()
        n <- solve(matrix, ...)
        x$setInverse(n)
        n
        
        
}
