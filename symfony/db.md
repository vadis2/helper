# Entity
1. create db
```
sudo php bin/console doctrine:database:create
```
2. check query
```
sudo php bin/console doctrine:schema:update --dump-sql
```
3. create tables
```
sudo php bin/console doctrine:schema:update --force
```
4. To check db by CLI
```
./bin/console doctrine:query:sql 'SELECT * FROM genus'
```
