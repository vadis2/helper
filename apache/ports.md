# Ports
## Commands
|description                  |command                                     |
|-----------------------------|--------------------------------------------|
|search IPv4                  |sudo ss -4 -tlnp | grep 80                  |
|search IPv6                  |sudo ss -6 -tlnp | grep 80                  |

## To free port from Nginx
Stop Nginx:
````
sudo systemctl stop nginx
````
Check:
````
sudo ss -4 -tlnp | grep 80
````
