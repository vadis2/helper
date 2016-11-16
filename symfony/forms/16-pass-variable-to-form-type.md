# Pass variable to form type
https://github.com/symfony/symfony/commit/adf20c86fb0d8dc2859aa0d2821fe339d3551347

```
Passing custom data to forms now needs to be done 
through the options resolver. 

    In the controller:

    Before:
    $form = $this->createForm(new MyType($variable), $entity, array(
        'action' => $this->generateUrl('action_route'),
        'method' => 'PUT',
    ));

    After: 
    $form = $this->createForm(MyType::class, $entity, array(
        'action' => $this->generateUrl('action_route'),
        'method' => 'PUT',
        'custom_value' => $variable,
    ));

    In the form type:
    
    Before:

    class MyType extends AbstractType
    {
        private $value;
    
        public function __construct($variableValue)
        {
            $this->value = $value;
        }
    }

    After:

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $value = $options['custom_value'];
    }
    
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'custom_value' => null,
        ));
    }

```