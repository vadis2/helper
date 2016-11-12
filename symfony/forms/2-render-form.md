# Render form
## controller
```
public function newAction()
{
    $form = $this->createForm(GenusFormType::class);
    return $this->render('admin/genus/new.html.twig', [
        'genusForm' => $form->createView()
    ]);
}
```
## view
```
{% extends 'base.html.twig' %}

{% block body %}
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h1>New Genus</h1>

                {{ form_start(genusForm) }}
                    {{ form_widget(genusForm) }}

                    <button class="btn btn-primary" type="submit">Save</button>
                {{ form_end(genusForm) }}
            </div>
        </div>
    </div>
{% endblock %}
```

