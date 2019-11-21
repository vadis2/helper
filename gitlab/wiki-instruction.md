# Git global setup
````
git config --global user.name "Vadiasov Volodymyr"
git config --global user.email "volodymyr.vadiasov@gmail.com"
````

# Create a new repository
````
git clone https://gitlab.com/scaamano/crmfrontend.git
cd crmfrontend
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
````

# Push an existing folder
````
cd existing_folder
git init
git remote add origin https://gitlab.com/scaamano/crmfrontend.git
git add .
git commit -m "Initial commit"
git push -u origin master
````

#Push an existing Git repository
````
cd existing_repo
git remote rename origin old-origin
git remote add origin https://gitlab.com/scaamano/crmfrontend.git
git push -u origin --all
git push -u origin --tags
````
