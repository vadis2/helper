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
## use container (object to call services)
```
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class GenusController extends Controller {
    $templating = $this->container->get('templating');
}
```

## use templaiting
```
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class GenusController extends Controller {
    $templating = $this->container->get('templating');
    $html = $templating->render('genus/show.html.twig', array(
                'name' => $genusName
            ));
}

or

public function showAction($genusName)
    {
        return $this->render('genus/show.html.twig', array(
            'name' => $genusName));
    }
```
View: app/Resources/views/genus/show.html.twig
```
<h1>The Genus {{ name }}</h1>
```

## clear cache
```
sudo php bin/console cache:clear --env=dev
sudo php bin/console cache:clear --env=prod
```

## css
```
{% block stylesheets %}
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/fontawesome/css/font-awesome.min.css') }}">
{% endblock %}
```

## js
```
{% block javascripts %}
    <script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="{{ asset('js/main.js') }}"></script>
{% endblock %}
```
## links
```
view:
<a href="{{ path('genus_show_notes', {'genusName': name}) }}">Json Notes </a>

route in controller:
@Route("/genus/{genusName}/notes", name="genus_show_notes")
```
