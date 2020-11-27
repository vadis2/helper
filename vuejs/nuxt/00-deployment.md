# Deployment
## Check .gitignore
## Create remote repo
## Create remote domain
## Clone repo
## Prepare domain
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/project.pp.ua
````
````
server {
    listen 80;
    listen [::]:80;

    root /var/www/project.pp.ua/mpfe;
    index index.html index.php index.htm;

    server_name project.pp.ua www.project.pp.ua;


    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
````
Enable both the sites by creating symbolic links to the sites-enabled directory
````
sudo ln -s /etc/nginx/sites-available/project.pp.ua /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/project.pp.ua
````
Do an Nginx configuration test:
Then reload Nginx if OK is displayed
````
sudo nginx -t
sudo /etc/init.d/nginx restart
## Install dependencies
````
## Create bash alias
````
sudo nano ~/.bashrc
````
````
alias ec='cd /var/www/autoadmin.pp.ua'
````
````
. ~/.bashrc
````

npm install
````
## build production
````
npm run build
npm run start
sudo npm install pm2 -g //for the first time
pm2 start npm -- start  
````

### Errors with ports
+ Close terminal with open port
+ Find all opened ports
+ First kill ports for pm
+ Second kill (if it exist) port 4002 
|----------------------------|-------------------------------|
| netstat -nlp VL grep :400* |  VL!!! find used ports        |
| kill -9 xxxxx              |  kill process and free a port |
| npm cache clear --force    |  cache clearing               |

