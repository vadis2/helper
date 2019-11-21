# How to create helper
1. Create file
* app/helpers.php
* app/Http/helpers.php

2. Autoload helper: composer.json
````
"autoload": {
    "files": [
        "app/helpers.php"
    ],
    "classmap": [
        "database/seeds",
        "database/factories"
    ],
    "psr-4": {
        "App\\": "app/"
    }
},
````
3. Change current dump:
````
composer dump-autoload
````
4. Helper example:
````
if (! function_exists('show_route')) {
    function show_route($model, $resource = null)
    {
        $resource = $resource ?? plural_from_model($model);

        return route("{$resource}.show", $model);
    }
}

if (! function_exists('plural_from_model')) {
    function plural_from_model($model)
    {
        $plural = Str::plural(class_basename($model));

        return Str::kebab($plural);
    }
}
````
5. Using in controller:
````
$model = new App\LineItem;
plural_from_model($model); // line-items
````
