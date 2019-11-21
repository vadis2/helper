# Local error
## dhh.com leads to 500
Real cases:
1. After clean cache

Check solution:
````
sudo chmod -R 777 ./public
sudo chmod -R 777 ./storage
sudo chmod -R 777 ./bootstrap/cache
````
