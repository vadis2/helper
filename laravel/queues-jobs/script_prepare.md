# Code
````
#!/bin/bash  
echo "This is a shell script to prepare for Laravel Jobs"
cd /usr/share/nginx/dhh.com/dhh/dhh
rm -f storage/app/public/unit_photos/*
rm -f storage/app/public/thumbs/*
php artisan cache:clear
composer dump-autoload
cd /etc/supervisor/conf.d
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-worker:*
cd /usr/share/nginx/dhh.com/dhh/dhh
php artisan queue:restart
````

Do it executable:
````
sudo chmod +x jobs_prepare.sh
````
Execute:
````
sudo /bin/jobs_prepare.sh
````