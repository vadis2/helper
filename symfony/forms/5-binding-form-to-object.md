# Binding form to Object
1. Binding
```
class GenusFormType extends AbstractType
{

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Genus::class,
        ]);
    }

}
```
2. check what form return
Must be array:
```
if ($form->isSubmitted() and $form->isValid()) {
    dump($form->getData());
    die();
}
```

3. add fields
```
class GenusFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('subFamily')
            ->add('speciesCount')
            ->add('funFact')
            ->add('isPublished')
            ->add('firstDiscoveredAt')
        ;
    }
}
```
4. check what form return
Must be Object:
```
if ($form->isSubmitted() and $form->isValid()) {
    dump($form->getData());
    die();
}
```
5. help to dropdown with data of other table
In other table/entity:
```
class SubFamily
{
... lines 13 - 39
    public function __toString()
    {
        return $this->getName();
    }
}
```
6. check what form return
Must be Object with included object:
```
if ($form->isSubmitted() and $form->isValid()) {
    dump($form->getData());
    die();
}
```
