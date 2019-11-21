````
X - numpy array!

means = X.mean(axis=0)
print 'Средние значения:\n', means
stds = X.std(axis=0)
print '\nСтандартное отклонение:\n', stds
X_scaled = np.divide((X - means), stds)
````