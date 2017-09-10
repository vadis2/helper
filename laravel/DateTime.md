````
$date = $row->created_at;

$dateObj   = \DateTime::createFromFormat('Y-m-d G:i:s', $date);
$row->year  = $dateObj->format('Y');
$row->month = $dateObj->format('F');
$row->day   = $dateObj->format('d');
````