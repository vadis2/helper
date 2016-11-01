# VAGRANT-VM. GET STARTED
## links
http://eax.me/vagrant/

## workflow
Download box
```
vagrant box add ubuntu/trusty64
vagrant box list
```
Create a base Vagrantfile:
```
mkdir -p ~/vagrant/ubuntu-test
cd ~/vagrant/ubuntu-test
vagrant init ubuntu/trusty64
```
Other commands with init:
https://www.vagrantup.com/docs/cli/init.html

Start from my_dir 
```
sudo vagrant up
```
Check
```
vagrant global-status
```
To stop machine
```
vagrant destroy fccd81c
```

## Errors:
http://askubuntu.com/questions/41550/how-do-i-run-a-64-bit-guest-in-virtualbox

Do virtualization enabled in BIOS.