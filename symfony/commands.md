#COMMANDS
|Descriptions        |command                                      |
|--------------------|---------------------------------------------|
|CLI commands list  3
 |bin/console                              |
|routes list         |sudo php bin/console debug:router            |
|container list      |sudo php bin/console debug:container         |
|List of services    |sudo php bin/console config:dump-reference          |
|Concrete service    |sudo php bin/console config:dump-reference twig     |
|Create DB           |sudo php bin/console doctrine:database:create    |
|Check query to DB   |sudo php bin/console doctrine:database:schema:update --dump-sql    |
|Create DB tables    |sudo php bin/console doctrine:database:schema:update --force    |
|To check service exist|bin/console|
|--------------------|---------------------------------------------|

| cache              |                                      |
|--------------------|---------------------------------------------|
|clear cache         |php bin/console cache:clear --env=dev |
|                    |php bin/console cache:clear --env=prod|

