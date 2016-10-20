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