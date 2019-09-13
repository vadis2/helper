# Deployment
## Check local domain
1. Check git status of master branch. All checking commits must be in master.
2. Terminal:
````
npm run build 
````
## Online server
1. Check API server:
    
    1.1. Migration, seeding.

2. Locally commit changes, merge to master, push to remote repo.
3. Check git status at online server.
4. Pull from remote repo.
5. npm install new dependencies if they are.
6. npm run build
7. Check site.
8. npm cache clear --force for pages where there are problems with output.
9. Create version/tag. 

   
