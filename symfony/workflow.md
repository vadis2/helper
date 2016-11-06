# SYMFONY PROJECT. WORKFLOW
## delete default controller
```
cd ./src/AppBundle/Controller
rm -rf DefaultController.php
```
## create new controller
```
touch GenusController.php 
```

```
<?php

namespace AppBundle\Controller;

class GenusController
{

}
```
The namespace must match the directory structure!

Add public function showAction()
```
public function showAction()
{

}
```

Add route
```
/**
* @Route("/genus")
*/
```
It call in code
```
use Symfony\Component\Routing\Annotation\Route;
```

The only rule for a controller is that it must return a Symfony Response object.

```
return new Response('Under the sea!');
```
It call in code
```
use Symfony\Component\HttpFoundation\Response;
```
Check
```
http://localhost:8000/genus
```
## dynamic url
```
class GenusController
{
    /**
     * @Route("/genus/{genusName}")
     */
    public function showAction($genusName)
    {
        return new Response('The genus: ' . $genusName);
    }
}
```