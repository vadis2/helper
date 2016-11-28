# Style form
```
public function buildForm(FormBuilderInterface $builder, array $options)
{
    $builder
        ->add('name')
        ->add('logo');
}
```
Start from:
```
{{ form_label(teamForm.name) }}
{{ form_errors(teamForm.name) }}
{{ form_widget(teamForm.name) }}
```
To:
Principles:
1. wrapper with direct styling
2. pass style as attributes in starts rows
```
{{ form_start(teamForm, { 'attr': {'class': 'form-horizontal form-label-left'} }) }}
<div class="item form-group">
    {{ form_label(teamForm.name, 'Name', { 'label_attr': {'class': 'control-label col-md-3 col-sm-3 col-xs-12'} }) }}
    {{ form_errors(teamForm.name) }}
    <div class="col-md-6 col-sm-6 col-xs-12">
        {{ form_widget(teamForm.name, { 'attr': {'class': 'form-control col-md-7 col-xs-12'} }) }}
    </div>
</div>
<div class="item form-group">
    {{ form_label(teamForm.logo, 'Logo', { 'label_attr': {'class': 'control-label col-md-3 col-sm-3 col-xs-12'} }) }}
    {{ form_errors(teamForm.logo) }}
    <div class="col-md-6 col-sm-6 col-xs-12">
        {{ form_widget(teamForm.logo, { 'attr': {'class': 'form-control col-md-7 col-xs-12'} }) }}
    </div>
</div>
<div class="ln_solid"></div>
<div class="form-group">
    <div class="col-md-6 col-md-offset-3">
        <button type="submit" class="btn btn-primary">Cancel</button>
        <button class="btn btn-success" type="submit">Save</button>
    </div>
</div>

{{ form_end(teamForm) }}
```
