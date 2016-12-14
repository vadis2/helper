## links
```
view:
<a href="{{ path('genus_show_notes', {'genusName': name}) }}">Json Notes </a>

route in controller:
@Route("/genus/{genusName}/notes", name="genus_show_notes")
```