# GIT
## global config
```
gedit ~/.gitconfig
```
Add
```
[alias]
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
```
## commands

|to do                 |command                  |
|----------------------|-------------------------|
|Cancel Staged changes |git reset HEAD hello.html|
|Create branch         |git checkout -b new_banch|
|Delete local branch   |git co master           |
|                      |git branch -d the_local_branch|