# create file in /bin
script.sh (or simple 'script') 

# first line
````
#!/bin/bash
````

# test script
````
#!/bin/bash  
echo "This is a shell script"  
ls -lah  
echo "I am done running ls"  
SOMEVAR='text stuff'  
echo "$SOMEVAR"  
````

# do it executable
````
sudo chmod +x script.sh
````

# execute
````
sudo ./script.sh
sudo /bin/script.sh
sudo script.sh (if you are in bin dir)
````