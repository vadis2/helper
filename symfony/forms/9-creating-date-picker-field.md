# Creating date picker field
## DateType
Not all browser supports
```
->add('firstDiscoveredAt', DateType::class, [
                'widget' => 'single_text',
            ]);
```
## Adding a JavaScript Date Picker 
1. View:
```
add css

{% extends 'base.html.twig' %}

{% block stylesheets %}
    {{ parent() }}

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.css">
{% endblock %}

add js

{% block javascripts %}
    {{ parent() }}

    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js"></script>

    <script>
        jQuery(document).ready(function() {
            $('.js-datepicker').datepicker();
        });
    </script>
{% endblock %}
```
2. GenusFormType
```
->add('firstDiscoveredAt', DateType::class, [
    'widget' => 'single_text',
    'attr'   => ['class' => 'js-datepicker'],
    'html5'  => FALSE,
]);
```
## date format
Configure date format:
```
{% block javascripts %}
... lines 10 - 13
    <script>
        jQuery(document).ready(function() {
            $('.js-datepicker').datepicker({
                format: 'yyyy-mm-dd'
            });
        });
    </script>
{% endblock %}
```




