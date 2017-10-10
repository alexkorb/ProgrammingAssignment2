## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  v <- NULL ##
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) v <<- inverse ## NOT SURE WHAT THIS IS DOING?
  getinv <- function() v
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  v <- x$getinv()
  if(!is.null(v)) { ## if the inverse exists, then return it
    message("getting matrix inverse")
    return(v)
  }
  data <- x$get() ## get the matrix to solve
  v <- solve(data, ...) ##solve the matrix
  x$setinv(v) ## set the solution to save for later
  v ## return the inverse
}
