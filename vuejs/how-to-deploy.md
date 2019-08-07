# How to deploy
## True way for CI
https://medium.com/@Web_Bailey/deploy-a-vuejs-app-with-digitalocean-fd6e7af07e40

## Bad way for one time
1. Create build
2. Create local git repo 
````
cd dist
git init
git remote add origin https://gitlab.com/scaamano/crmfrontend.git
````
3. Create commit
4. Push
````
git push -u origin master
````
