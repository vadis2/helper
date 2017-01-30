|----------------------------|-------------------------------------------------------------|
| Error                      | Action                                                      |
|----------------------------|-------------------------------------------------------------|
|500 for all local pages LAMP|sudo chgrp -R www-data /var/www/lcore.com/public_html/core   |
|                            |sudo chmod -R 775 /var/www/lcore.com/public_html/core/storage|