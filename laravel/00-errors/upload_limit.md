# Request Entity Too Large" (413)
https://www.cyberciti.biz/faq/linux-unix-bsd-nginx-413-request-entity-too-large/
````
cd /etc/nginx
sudo nano nginx.conf
````

add or edit in http section:
````
client_max_body_size 100m;
````
Test:
````
sudo nginx -t
````
Reload nginx:
````
service nginx reload
````

