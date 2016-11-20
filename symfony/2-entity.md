# Entity
## Preparations
1. cd 
2. mkdir Entity
3. phpStorm: right click new Class
  1. Class: Team
  2. Namespace: AppBundle\Entity;
3. phpStorm: Code->Generate ( Alt + Insert )->ORM Class
  1. Must be auto inserting 
```
use Doctrine\ORM\Mapping as ORM;
```

## Insert variables 
```
private $id 
etc
```
## ORM Annotations
1. phpStorm: Code->Generate ( Alt + Insert )->ORM Annotations
2. definitions

|Doctrine|MySQL|
|--------|-----|
|string  |varchar|

http://docs.doctrine-project.org/projects/doctrine-orm/en/latest/reference/basic-mapping.html#property-mapping


3. create db
```
sudo php bin/console doctrine:database:create
```
7. check query
```
sudo php bin/console doctrine:schema:update --dump-sql
```
8. create tables
```
sudo php bin/console doctrine:schema:update --force
```
9. phpStorm: Code->Generate ( Alt + Insert )->Getters and Setters

10. To save:
```
$genus = new Genus();
        $genus->setName('Octopus' . rand(1, 100));
        
        $em = $this->getDoctrine()->getManager();
        $em->persist($genus);
        $em->flush();
```
11. To check db by CLI
```
./bin/console doctrine:query:sql 'SELECT * FROM genus'
```
