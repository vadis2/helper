# Commands
|description                  |command                                                       |
|-----------------------------|--------------------------------------------------------------|
|show branches and commits    |git show-branch                                               |
|list                         |git remote                                                    |
|in detailes                  |git remote show origin                                        |
|local list                   |git branch                                                    |
|local + remote list          |git branch -a                                                 |
|push from local to new branch|git push origin local_branch1:remote_branch2                  |
|clone from other branch      |git clone --single-branch --branch <branchname> <remote-repo> |
|make Git ignore mode change  |git config core.fileMode false                                |

|description                     |command                                     |
|--------------------------------|--------------------------------------------|
|delete file from index          |git rm --cached [file]                      |
|delete dir with files from repo |deleting!!! git rm -rf dir                  |
|                                |... git pom                                 |

## Origin (remote repo)
|description                     |command                                                                 |
|--------------------------------|------------------------------------------------------------------------|
|list remote origin              |git remote -v                                                           |
|add remote origin               |git remote add origin ssh://git@bitbucket.org/vvadis/srs.git            |
|change remote origin            |git remote set-url origin git@github.com:vadis2/cihmvcd.git             |
|change remote origin            |git remote set-url origin https://gitlab.com/VVadis/vue-press-blog.git  |

## Additional remote repo
|description                     |command                                                                 |
|--------------------------------|------------------------------------------------------------------------|
|set a new remote                |git remote add new_repo_name git@github.com:vadis2/cihmvcd.git          |
|verify new remote               |git remote -v                                                           |
|push                            |git push new_repo_name                                                  |
|push to branch                  |git push new_repo_name <branch>                                         |

## Branches
|description                     |command                                             |
|--------------------------------|----------------------------------------------------|
|create branch, redirect to it   |git co -b smallchanges                              |
|see all branches                |git branch                                          |
|see all branches history        |git hist --all                                      |
|redirect to branch master       |git checkout master                                 |
|see file                        |cat lib/hello.html                                  |
|see file                        |cat lib/hello.html                                  |
|Merge from master to style      |git checkout style                                  |
|                                |git merge master                                    |
|                                |git hist --all                                      |
|Delete branch with checking     |git branch -d testing                               |
|Delete branch without checking  |git branch -D testing                               |
|Delete all branch except master |git branch | grep -v "master" | xargs git branch -D |
