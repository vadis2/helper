# Create controller
## CLI
```
php bin/console generate:controller

Attention:
first answer: AppBundle: Team 
create TeamController.php in AppBundle
with
namespace and use
```
## create functions
```
public function indexAction()
{
    
}

public function showAction()
{
    
}

public function newAction()
{
    
}

public function updateAction()
{
    
}
```
## check routes config
app/config/routing.yml
Must be:
```
team:
    resource: "@TeamBundle/Controller/"
    type:     annotation
```
## add route for each function
```
@Route("/admin/team")

This must insert:
 
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
```

## check routes
```
php bin/console debug:router
```
## Insert response
The only rule for a controller is that it must return a Symfony Response object.
```
return new Response('Index action!');

Must insert

use Symfony\Component\HttpFoundation\Response;
```
## Check browser
```
http://localhost:8000/genus
```


