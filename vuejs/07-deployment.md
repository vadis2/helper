# Deployment
## Check local domain
1. Check git status of master branch. All checking commits must be in master.
2. Terminal:
````
npm run build 
````
3.Check functionality.

## Online back-server
1. Check API server:
    
    1.1. Migration, seeding.
    1.2. If it needs delete dir public/docs from remote repo: https://github.com/vadis2/helper/blob/master/git/delete-dir-from-remote-repo.md

2. Locally commit changes, merge to master, push to remote repo.
3. Check git status at online server.
4. Pull from remote repo.
5. ````php artisan storage:link````
6. ````cda````
7. ````pamfs````
8. ````testf````
9. Create documentation: ```` php artisan apidoc:generate````
10. Check documentation.

## Online front-end server
1. Check git status
2. Locally commit changes, merge to master, push to remote repo.
3. Check git status at online server.
4. Pull from remote repo.
5. ````npm install````
6. ````npm run build````
7. Check site.

## Create version/tag on both servers
https://github.com/vadis2/helper/blob/master/git/semver/02-git-commands.md
   
