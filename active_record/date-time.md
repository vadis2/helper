# DATE, TIME
https://www.startutorial.com/articles/view/master-php-datetime

## carbon
http://carbon.nesbot.com/#gettingstarted
## datetime
To save
```
ActiveRecord\Connection::$datetime_format = 'Y-m-d H:i:s';
$now = new ActiveRecord\DateTime('2010-01-02 03:04:05');
$item->datetime_field=$now;
$item->save;
```
Select <
```
$from = '2016-10-02 03:04:04';
$string = "start_date < '$from'";
$tasks = Task::find('all', array('conditions' => $string));
```
Select between
```
$from = '2016-10-02 03:04:04';
$to = '2016-10-04 03:04:07';
$string = "start_date BETWEEN '$from' AND '$to'";
$tasks = Task::find('all', array('conditions' => $string));
```
select field 1 > and field 2 <
```
$from = '2016-10-04 03:04:04';
$to = '2016-10-04 03:04:04';
$string = "start_date < '$to' AND end_date > '$from'";
$tasks = Task::find('all', array('conditions' => $string));
```
Link about comparison: 
http://dev.mysql.com/doc/refman/5.7/en/comparison-operators.html#operator_less-than

## weekend
$inputDate->format('N') >= 6;