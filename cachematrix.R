## Put comments here that give an overall description of what your
## functions do


makeCacheMatrix <- function(x = matrix()) {
  m <<-NULL
  set <- function(y) {
    x <<- y
    m <<-NULL
  }
  get <- function() x
  setSolveMatrix <- function(solveMatrix) m <<- solveMatrix
  getSolveMatrix <- function() m
  list(set = set, get = get,
       setSolveMatrix = setSolveMatrix,
       getSolveMatrix = getSolveMatrix)
}



cacheSolve <- function(x, ...) {
  m <- x$getSolveMatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setSolveMatrix(m)
  m
}
