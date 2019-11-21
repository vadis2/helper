1. Create repo in github
2. Locally
````
cd package_root
git init
git add .
git commit -m "First commit"

create remote repo

git remote add origin https://github.com/vadiasov/roles-admin.git
git push -u origin master
git tag -a 1.0 -m "New version"
git push --tags
````