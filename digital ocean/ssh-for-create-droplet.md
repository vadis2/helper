Current ssh keys are in ~/.ssh

To check:
````
cd ~/.ssh
ls
````

When create droplet copy public key:
````
cat ~/.ssh/id_rsa.pub
````

Test:
````
ssh root@ip.ip.ip.ip
````