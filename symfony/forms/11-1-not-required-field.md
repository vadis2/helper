# Not required field
````
class TeamFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('logo', FileType::class, array('label'=>'Team Logo Image', 'required'=> false, 'attr'=>array('onchange' => 'readURL(this);')));
    }
````