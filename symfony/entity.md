# Entity
## coding
0. cd 
1. mkdir Entity
2. phpStorm: right click new Class
3. phpStorm: Code->Generate ( Alt + Insert )->ORM Class
4. Insert 
```
use Doctrine\ORM\Mapping as ORM;
```
4. Insert 
```
private $id etc
```
5. phpStorm: Code->Generate ( Alt + Insert )->ORM Annotations
## definitions
|Doctrine|MySQL|
|--------|-----|
|string  |varchar|

6. create db
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
