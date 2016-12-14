# DB
## access
```
$pdo = new PDO('mysql:host=localhost;dbname=re_1;charset=UTF8', 'root', '456v123');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$statement = $pdo->prepare('SELECT * FROM ship');
$statement->execute();
$shipsArray = $statement->fetchAll(PDO::FETCH_ASSOC);
```