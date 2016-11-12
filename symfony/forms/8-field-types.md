# Field types
## Form Types Reference
http://symfony.com/doc/current/reference/forms/types.html

## ChoiceType
GenusFormType:
```
$builder
    ->add('isPublished', ChoiceType::class, [
            'choices' => [
                'Yes' => true,
                'No' => false,
            ]
        ])
```
## Entity Type
subFamily links to other table
```
->add('subFamily', NULL, [
    'placeholder' => 'Choose a Sub Family'
])
```

### custom query
1. Create repository
```
<?php

namespace AppBundle\Repository;

use AppBundle\Entity\Genus;
use Doctrine\ORM\EntityRepository;

class SubFamilyRepository extends EntityRepository
{
    public function createAlphabeticalQueryBuilder()
    {
        return $this->createQueryBuilder('sub_family')
                    ->orderBy('sub_family.name', 'ASC');
    }
}

```
2. edit Entity
```
/**
 * @ORM\Entity(repositoryClass="AppBundle\Repository\SubFamilyRepository")
 * @ORM\Table(name="sub_family")
 */
```
3. GenusFormType:
```
->add('subFamily', EntityType::class, [
    'class' => SubFamily::class,
    'query_builder' => function(SubFamilyRepository $repo) {
        return $repo->createAlphabeticalQueryBuilder();
    }
])
```

