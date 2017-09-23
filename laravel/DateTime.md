````
$date = $row->created_at;

$dateObj   = \DateTime::createFromFormat('Y-m-d G:i:s', $date);
$row->year  = $dateObj->format('Y');
$row->month = $dateObj->format('F');
$row->day   = $dateObj->format('d');
````

https://github.com/jenssegers/date
````
public static function addTimeLeft($discounts)
    {
        Date::setLocale('en');

        $result = [];
        foreach ($discounts as $discount) {
            $end = Date::createFromFormat('Y-m-d', $discount->end);
            $left=Date::now()->timespan($end);
            $discount->left = $left;
            $result[$discount->id]       = $discount;
        }

        return $result;
    }
````