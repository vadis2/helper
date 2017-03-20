# Routes
## To see all routes
```
./bin/console debug:router
```
## workflow
1. routing_dev.yml
2. routing.yml

## alternative route rule in routing.yml
```
app:
    resource: "@AppBundle/Controller/"
    type:     annotation

homepage:
    path: /
    defaults:
        _controller: AppBundle:Main:homepage
```