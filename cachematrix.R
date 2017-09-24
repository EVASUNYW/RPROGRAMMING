## a pair of functions that cache the inverse of a matrix 


## this function creates a special "matrix" object that can cache its inverse.
##The frst function, makeCacheMatrix create a special matrix, where is really a list containing a function to:
   # 1.set the value of the matrix
   # 2.get the value of the matrix
   # 3. set the value of inverse of the matrix
   # 4.get the value of inverse of the matrix
   

    makeCacheMatrix <- function(x = matrix()) {
            inverse <- NULL
            set<- function(y) {
                 x<<- y
                 inverse <<- NULL
                               
}
          get <- function() x 
          setInverse <- function(solveMatrix)  inverse <<- solveMatrix 
          getInverse <- function() inverse 
   list(set = set, 
        get = get, 
        setInverse = setInverse, 
        getInverse = getInverse)
   }
##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#Firstly, it will check whether the inverse has been computed or not.
#If it has been computed, it will get the result and skip the computation. If not, it will computes the inverse, sets the value in the cache through setInverse function. 

# This function under the assumption that the matrix is always invertible. 
 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getInverse()
        if(!is.null(inverse)){
        	message("getting cached data")
        	return(inverse)
        }
        data <-x$get()
        inverse <- solve(data,...)
        x$setInverse(inverse)
        inverse
}
#sample show:
#WWW <-makeCacheMatrix(matrix(1:4, 2, 2))
#> WWW$get()
    # [,1] [,2]
#[1,]    1    3
#[2,]    2    4
# WWW$getInverse()
#NULL
#> cacheSolve(WWW)
   #  [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
#> cacheSolve(WWW)
#getting cached data
 #    [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
#> 
