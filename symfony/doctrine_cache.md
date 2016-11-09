# doctrine_cache
## composer.json
```
"doctrine/doctrine-cache-bundle": "^1.2",
```

## AppKernel
```
new Doctrine\Bundle\DoctrineCacheBundle\DoctrineCacheBundle(),
```

## config.yml
To know service name:
```
./bin/console config:dump-reference
```
Insert new service of caching:
```
doctrine_cache:
    providers:
        my_markdown_cache:
            type: file_system
```
There is new service:
```
doctrine_cache.providers.my_markdown_cache
```
You can check:
```
./bin/console debug:container my_markdown_cache
```

## how use
### code
```
$cache = $this->get('doctrine_cache.providers.my_markdown_cache');
$key = md5($funFact);
if ($cache->contains($key)) {
    $funFact = $cache->fetch($key);
} else {
    sleep(1); // fake how slow this could be
    $funFact = $this->get('markdown.parser')
        ->transform($funFact);
    $cache->save($key, $funFact);
}        
```
### config.yml
```
doctrine_cache:
    providers:
        my_markdown_cache:
            type: file_system
            file_system:
                directory: %kernel.cache_dir%/markdown_cache
```
To check see var/cache/dev/doctrine/cache

### prod
Run
```
./bin/console cache:clear --env=prod
```
to see after edited page.




