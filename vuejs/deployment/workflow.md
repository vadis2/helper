# Workflow
## If first time:
1. git clone ...
2. cd {root}
3. npm install
4. npm run build
5. Edit:
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/metras5.com

If first time:
sudo ln -s /etc/nginx/sites-available/metras5.com /etc/nginx/sites-enabled

Change to "dist".
````
6. Restart nginx
Do an Nginx configuration test:
````
sudo nginx -t
````
Then reload Nginx if OK is displayed
````
sudo systemctl reload nginx
````
Insert new domain metras5.com
````
sudo nano /etc/hosts
````
