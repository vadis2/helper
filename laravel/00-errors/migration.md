# Migration
````
[Doctrine\DBAL\Driver\PDOException]                                                                                  
  SQLSTATE[42000]: Syntax error or access violation: 
  1075 Incorrect table definition; there can be only one auto colu  
  mn and it must be defined as a key  
````

tinyint('processed'), but not tinyint('processed', 1)