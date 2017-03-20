# Templating
1. create _form.html.twig file with form
```
{{ form_start(genusForm) }}
    {{ form_row(genusForm.name) }}
    {{ form_row(genusForm.subFamily) }}
    {{ form_row(genusForm.speciesCount, {
        'label': 'Number of Species'
    }) }}
    {{ form_row(genusForm.funFact) }}
    {{ form_row(genusForm.isPublished) }}
    {{ form_row(genusForm.firstDiscoveredAt) }}
<button type="submit" class="btn btn-primary" formnovalidate>Save</button>
{{ form_end(genusForm) }}
```
2. create template  formLayout.html.twig
```
{% extends 'base.html.twig' %}

{% block stylesheets %}
    {{ parent() }}

    <link rel="stylesheet"
          href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.css">
{% endblock %}

{% block javascripts %}
    {{ parent() }}

    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js"></script>

    <script>
        jQuery(document).ready(function () {
            $('.js-datepicker').datepicker({
                format: 'yyyy-mm-dd'
            });
        });
    </script>
{% endblock %}
```
3. "Edit" view
```
{% extends 'admin/genus/formLayout.html.twig' %}

{% block body %}
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1>Edit Genus</h1>

                {{ include('admin/genus/_form.html.twig') }}
            </div>
        </div>
    </div>
{% endblock %}
```
