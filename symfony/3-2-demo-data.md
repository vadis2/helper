# Demo data
## composer.json
```
"require-dev": {

        "nelmio/alice": "^2.1",
        "doctrine/doctrine-fixtures-bundle": "^2.3"
    },
```
## AppKernel.php
```
public function registerBundles()
{

    if (in_array($this->getEnvironment(), array('dev', 'test'), true)) {

        $bundles[] = new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle();
    }

}
```
## create dir your_bundle/DataFixtures/ORM
## create class LoadFixtures in it
```
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use yourBundle\Entity\Genus;

class LoadFixtures implements FixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $genus = new Genus();
        $genus->setName('Octopus'.rand(1, 100));
        $genus->setSubFamily('Octopodinae');
        $genus->setSpeciesCount(rand(100, 99999));
        $manager->persist($genus);
        $manager->flush();
    }
}
```
```
./bin/console doctrine:fixtures:load
```
1 row created in DB.

# use Alice
https://github.com/nelmio/alice
## create fixtures.yml 
in your_bundle/DataFixtures/ORM
## edit file
```
AppBundle\Entity\Genus:
    genus_{1..10}:
        name: <name()>
        subFamily: <text(20)>
        speciesCount: <numberBetween(100, 100000)>
        funFact: <sentence()>
```
```
class LoadFixtures implements FixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $objects = Fixtures::load(
            __DIR__.'/fixtures.yml',
            $manager,
            ['providers' => [$this]]
        );
    }
    
    public function team()
    {
        $teams =[
            'Arsenal',
            'Santos',
            'Dynamo',
            'Real',
            'Athletic',
            'City',
            'Derby',
            'Inter',
            'Flower',
            'Ice',
            'Sea',
            'River',
            'Ocean'
        ];
    
        $key = array_rand($teams);
    
        return $teams[$key].'-'.rand(1,3);
    }
}
```

```
./bin/console doctrine:fixtures:load
```

