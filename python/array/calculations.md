````
mean for each columns:
X - np array
means = X.mean(axis=0)

add colmn of 1 in the end
a = np.ones(X.shape[0]) 
a = a.reshape(a.size, 1)
X = np.hstack((X, a))
print X[1]
````
