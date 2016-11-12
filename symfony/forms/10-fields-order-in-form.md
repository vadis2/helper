# Fields order in form
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
```
