# Git Commands
|description                     |command                                                                             | short   |
|--------------------------------|------------------------------------------------------------------------------------|---------|
|annotated tags                  |git tag -a v1.4 -m 'my version 1.4'                                                 |         |
|to show all tags                |git tag                                                                             |         |   
|setup tag later                 |git log --pretty=oneline                                                            | git lpo |
|                                |15027957951b64cf874c3557a0f3547bd83b3ff6 Merge branch 'experiment'                  |         |
|                                |a6b4c97498bd301d84096da251c98a07c7723e65 beginning write support                    |         |
|                                |git tag -a v1.2 -m 'version 1.2' 7723e65                                            |         |
|send tag to the server          |git push origin v1.5                                                                |         |
|send all tags to the server     |git push origin --tags                                                              | git pot |  
|delete all tags locally         |git tag {vertical line} xargs git tag -d                                            |         |
|delete all tags on remote       |git tag -l {vertical line} xargs -n 1 git push --delete origin                      |         |
|delete one tag locally          |git tag -d 0.0.3                                                                    |         |
                      |   
