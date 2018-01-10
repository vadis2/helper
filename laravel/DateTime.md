# Installation
This date library extends Carbon with multi-language support. 

Methods such as format, diffForHumans, parse, createFromFormat 
and the new timespan, will now be translated based on your locale.
````
composer:
composer require jenssegers/date

config/app.php
'Date' => Jenssegers\Date\Date::class,
````

Create from DB (Carbon):
````
$date = $row->created_at;

$dateObj   = \DateTime::createFromFormat('Y-m-d G:i:s', $date);
$row->year  = $dateObj->format('Y');
$row->month = $dateObj->format('F');
$row->day   = $dateObj->format('d');
````

Create from DB (Jenssegers):
````
Date::setLocale('nl');

$date = Date::createFromFormat('l d F Y', 'zaterdag 21 maart 2015');

or

$date = $row->created_at;
$dateObj   = \DateTime::createFromFormat('Y-m-d H:i:s', $date);
````

create

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

Add days (or something):
````
$date = new DateTime('2000-01-01');
$date->add(new DateInterval('PT10H30S'));
echo $date->format('Y-m-d H:i:s') . "\n";

$date = new DateTime('2000-01-01');
$date->add(new DateInterval('P7Y5M4DT4H3M2S'));
echo $date->format('Y-m-d H:i:s') . "\n";
````