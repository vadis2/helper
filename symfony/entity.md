# Entity
## coding
0. cd 
1. mkdir Entity
2. phpStorm: Code->Generate ( Alt + Insert )->ORM Class
3. Insert 
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
8. create db
```
sudo php bin/console doctrine:schema:update --force
```
