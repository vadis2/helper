# Workflow
## I have an existing project
````
cd /path/to/your/repo

Step 2: Connect your existing repository to Bitbucket
git remote add origin ssh://git@bitbucket.org/iqdesk/botser.git
git push -u origin master
````
## I'm starting from scratch
````
git clone git@bitbucket.org:iqdesk/botser.git
cd botser
echo "# My project's README" >> README.md
git add README.md
git commit -m "Initial commit"
git push -u origin master
````

## See also
