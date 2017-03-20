# Delete file
## Bundle
https://packagist.org/packages/symfony/filesystem

## Documentation
http://symfony.com/doc/current/components/filesystem.html

## install
```
composer require symfony/filesystem
```

## check composer.json

## config.yml
```
parameters:
    image_directory: '%kernel.root_dir%/../web/uploads/images'
```

## controller
```
public function deleteAction($name)
    {
        $imagePath= $this->getParameter('image_directory') . '/0d66a6d5d038b23bd3f0ccb8574f339a.jpeg';
        
        $fileSystem = new Filesystem();
            
        try {
            $fileSystem->chmod($imagePath, 0777);
            $fileSystem->remove($imagePath);
        } catch (IOExceptionInterface $e) {
            return "An error occurred while remove image at ".$e->getPath();
        }
```