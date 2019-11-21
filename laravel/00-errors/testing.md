# InvalidArgumentException: Unable to locate factory with name [default] [App\Models\User]
Open /var/www/wny.com/wny/database/factories/UserFactory.php
Change to:
````
use App\Models\User;
````