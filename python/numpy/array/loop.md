# Loop
## Along axis
````
mymatrix = np.arange(1, 10, 1).reshape(3,3)

print mymatrix
def myfunction( x ):
    return sum(x)

print np.apply_along_axis( myfunction, axis=0, arr=mymatrix )

[[1 2 3]
 [4 5 6]
 [7 8 9]]
 
[12 15 18]
````