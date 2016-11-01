## Create a new repository on the command line

```
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/vadis2/helper.git
git push -u origin master
```
## Push an existing repository from the command line

```
git remote add origin https://github.com/vadis2/helper.git
git push -u origin master
```
## Clone repo from github

```
cd parent
git clone https://github.com/vadis2/helper.git
```

Will be created parent/helper wih appropriated files.

Cloning create origin.

## Switching remote URLs from HTTPS to SSH
   
   Open Terminal.
   
   Change the current working directory to your local project.
   
   List your existing remotes in order to get the name of the remote you want to change.
   
   ```
   git remote -v
   origin  https://github.com/USERNAME/REPOSITORY.git (fetch)
   origin  https://github.com/USERNAME/REPOSITORY.git (push)
   Change your remote's URL from HTTPS to SSH with the git remote set-url command.
   ```
   
   ```
   git remote set-url origin git@github.com:USERNAME/OTHERREPOSITORY.git
   ```
   Verify that the remote URL has changed.
   
   ```
   git remote -v
   Verify new remote URL
   origin  git@github.com:USERNAME/OTHERREPOSITORY.git (fetch)
   origin  git@github.com:USERNAME/OTHERREPOSITORY.git (push)
   ```
