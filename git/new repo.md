# New repo
I have an existing project
````
Step 1: Switch to your repository's directory
cd /path/to/your/repo
Step 2: Connect your existing repository to Bitbucket
git remote add origin ssh://git@bitbucket.org/vvadis/srs.git
git push -u origin master
````
I'm starting from the scratch
````
git clone git@bitbucket.org:vvadis/srs.git
cd srs
echo "# My project's README" >> README.md
git add README.md
git commit -m "Initial commit"
git push -u origin master
````

I'm starting from the scratch at online server
````
sudo git remote add origin https://vvadis@bitbucket.org/vvadis/srs-ui.git
sudo git pull origin master
````
