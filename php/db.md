# DB
## access
```
$pdo = new PDO('mysql:host=localhost;dbname=oo_battle1', 'root', '456v123');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$statement = $pdo->prepare('SELECT * FROM ship');
$statement->execute();
$shipsArray = $statement->fetchAll(PDO::FETCH_ASSOC);
```