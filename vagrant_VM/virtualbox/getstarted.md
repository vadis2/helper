# VIRTUAL BOX
## install
http://www.askmetutorials.com/2016/06/install-virtualbox-5024-on-ubuntu.html

Step 1: Before installing the new version , we need to remove the older using the software center or use the below command

```
sudo apt-get remove virtualbox virtualbox-4.* virtualbox-5.0
```
Step 2:Add the Packages list to sources.list 

```
sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list"
```
Check

```
sudo gedit /etc/apt/sources.list
```

Step 3: Download and install the Key for Virtualbox
```
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
```
Step 3: Update the Repository
```
sudo apt-get update
```

Step 4: Install Virtualbox 5.0.24
```
sudo apt-get install virtualbox-5.0
```