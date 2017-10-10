## These functions create a matrix object that can store it's inverse

## makeCacheMatrix creates an object that is essentially a matrix,
## but the code allows for it to save its inverse and to update the matrix data

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


## This function returns the inverse of a matrix object created by makeCacheMatrix
## If the inverse has already been solved, it fetches it.

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
