#!/bin/bash
#set -e
echo "Welcome!"
function check_done
if [ $? -eq 0 ]
  then
   printf "\e[32m$1 is completed\e[0m\n"
  else
    sleep 5s
    if [ $? -eq 0 ]
      then
        printf "$1 is completed\n"
      else
        printf "$1 is not completed\n"
        exit 1
    fi
fi

printf "Enter your new domain, please:\n"
read domain
printf "Domain is "$domain"\n"
cd /var/www
ls
printf "\n"
mkdir -p $domain
check_done "Create domain directory"

ls
printf "\n"

echo "<html>\n" >> $domain/index.html
echo "  <head>\n" >> $domain/index.html
echo "    <title>Welcome to $domain!</title>\n" >> $domain/index.html
echo "  </head>\n" >> $domain/index.html
echo "  <body>\n" >> $domain/index.html
echo "    <h1>Success!  The $domain server block is working!</h1>\n" >> $domain/index.html
echo "  </body>\n" >> $domain/index.html
echo "</html>" >> $domain/index.html

check_done "Index.html is created"

echo "server {\n" >> /etc/nginx/sites-available/$domain
echo "    root /var/www/$domain\n" >> /etc/nginx/sites-available/$domain
echo "    index index.php index.html index.htm;\n\n" >> /etc/nginx/sites-available/$domain
echo "    server_name $domain www.$domain;\n" >> /etc/nginx/sites-available/$domain
echo "    location / {\n" >> /etc/nginx/sites-available/$domain
echo "    }\n" >> /etc/nginx/sites-available/$domain
echo "        # First attempt to serve request as file, then\n" >> /etc/nginx/sites-available/$domain
echo "        # as directory, then fall back to index.html\n" >> /etc/nginx/sites-available/$domain
echo "        try_files $uri $uri/ /index.php?$query_string;\n\n" >> /etc/nginx/sites-available/$domain
echo "    location ~ \.php$ {\n" >> /etc/nginx/sites-available/$domain
echo "        try_files $uri =404;\n" >> /etc/nginx/sites-available/$domain
echo "        fastcgi_split_path_info ^(.+\.php)(/.+)$;\n" >> /etc/nginx/sites-available/$domain
echo "        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;\n" >> /etc/nginx/sites-available/$domain
echo "        fastcgi_index index.php;\n" >> /etc/nginx/sites-available/$domain
echo "        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\n" >> /etc/nginx/sites-available/$domain
echo "        include fastcgi_params;\n" >> /etc/nginx/sites-available/$domain
echo "    }\n" >> /etc/nginx/sites-available/$domain
echo "}\n" >> /etc/nginx/sites-available/$domain

check_done "NGINX server is configured"

sudo ln -s /etc/nginx/sites-available/helix.com /etc/nginx/sites-enabled

sudo nginx -t

check_done "NGINX server configuration is checked"

sudo systemctl reload nginx

check_done "NGINX is reloaded"

sudo nano /etc/hosts


