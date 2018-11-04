
## makeCacheMatrix function creates a special "matrix" object that can cache its inverse

# define matrix for future testing
my_matrix <- matrix(c(1, 5, 9, 10), nrow = 2, ncol = 2)

# create function with "matrix" as argument
# set initial "inverse" value to NULL
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  # create function to cache in the "inverse" value
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # function to get the "inverse" value
  get <- function() x
  
  # calculate the "inverse" value
  setInverse <- function(solve) inv <<- solve
  
  # get the "inverse" value
  getInverse <- function() inv
  
  # pass the "inverse" value to the list
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

#create new variable to be used by "cacheSolve" function
mm <- makeCacheMatrix(my_matrix)



## cacheSolve function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the matrix 
## has not changed), then the cacheSolve should retrieve the inverse from the cache.
  #Create function to get cache of the matrix
  cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  
  # get "inverse" data if it is cached
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # calculate the "inverse" value, if it is not cached
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}

# Use previous function variable "mm"as argument for "cacheSolve" function
mm <- makeCacheMatrix(my_matrix)
print(cacheSolve(mm))
