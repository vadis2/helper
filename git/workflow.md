# Workflow
1. Locally: Create new branch
2. Development
3. Bitbucket: create new branch
4. Locally:
````
git push origin new_branch
````
5. Server: 
````
sudo git pull origin new_branch

sudo git checkout new_branch

sudo php artisan migrate
````
6. Server: check functionality
7. Locally: 
````
git checkout master
git merge new_branch
git hist --all
````