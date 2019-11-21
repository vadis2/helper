https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04
https://chartio.com/resources/tutorials/how-to-set-the-default-user-password-in-postgresql/

````
sudo apt update
sudo apt install postgresql postgresql-contrib
````
Standard user: postgres

Log in as postgres:
````
sudo -i -u postgres
psql
````
Logout:
````
\q
````
Creating a New Database (as postgres):
````
createdb db_name
````

Changing password (after psql):

````
ALTER USER postgres PASSWORD 'myPassword'
````