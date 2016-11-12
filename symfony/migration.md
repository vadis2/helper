# Migration
## Help
http://symfony.com/doc/current/bundles/DoctrineMigrationsBundle/index.html

http://docs.doctrine-project.org/projects/doctrine-migrations/en/latest/index.html

## install
```
sudo composer require doctrine/doctrine-migrations-bundle
```
AppKernel:
```
new Doctrine\Bundle\MigrationsBundle\DoctrineMigrationsBundle(),
```

To check service exist:
```
bin/console
```

## workflow
**We need 1-5 or 3-5 only**
1. delete db
```
bin/console doctrine:database:drop --force
```
2. create db
```
bin/console doctrine:database:create
```
3. create migration file
```
bin/console doctrine:migrations:diff
```
4. open file to check

5. make migration
```
bin/console doctrine:migrations:migrate
```


