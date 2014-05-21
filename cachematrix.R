## Put comments here that give an overall description of what your
## functions do

## the following function stores 4 methods to set and get a matrix
## and to set and get its inverse. It doesnt calculate the inverse
## by itself

makeCacheMatrix <- function(x = matrix()) {
  #sets the inverse as a null object
  inv <<- NULL
  
  #method that receives the matrix for a instanced object
  set = function(y){
    mat <<- y
    inv <<- NULL
  }
  
  #method that returns the matrix for a instanced object
  get <- function() mat
  #method that may store a inverse calculated in another environment
  setinv <- function(inverse) inv <<- inverse
  #method that returns the inverse in cased it is stored using setinv
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)

}


## this function receives the preceeding function and caches
## the inverse of an alrady stored matrix
## if called again, the method will return the inverse without recalculating it 

cacheSolve <- function(x, ...) {
  
        ## Return a matrix that is the inverse of 'x'
        
        #gets the inverse from the received function if cached
        #informs if the inverse is already cached
        inv <- x$getinv()
        if(!is.null(inv)){
          message("The inverse is already stored. Returning it")
          return(inv)
        }
        
        #gets the matrix from the received function
        matrix <- x$get()
        
        #solves the inverse and caches it
        inv <- solve(matrix)
        x$setinv(inv)
        
        #return the calculated inverse
        inv
}
