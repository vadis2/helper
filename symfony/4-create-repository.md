# Create repository
## Insert in annotations row
```
// src/AppBundle/Entity/Product.php
namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProductRepository")
 */
class Product
{
    //...
}
```
## Run
```
php bin/console doctrine:generate:entities AppBundle
```
## Change
```
\Doctrine\ORM\EntityRepository
to 
use Doctrine\ORM\EntityRepository
and
class ProductRepository extends EntityRepository
{
}
```
