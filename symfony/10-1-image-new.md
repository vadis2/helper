# Image
http://symfony.com/doc/current/reference/constraints/Image.html
## newAction
### Entity
```
use Symfony\Component\Validator\Constraints as Assert;

class Team
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer", length=6 )
     */
    private $id;
    
    /**
     * @ORM\Column(type="string", length=30, unique=true)
     */
    private $name;
    
    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     *
     * @Assert\Image(
     *     minWidth = 200,
     *     maxWidth = 3000,
     *     minHeight = 200,
     *     maxHeight = 3000,
     * )
     */
    private $logo;
    
    /**
     * @return string
     */
    public function getLogo()
    {
        return $this->logo;
    }
    
    /**
     * @param string $logo
     */
    public function setLogo($logo = NULL)
    {
        $this->logo = $logo;
    }
```
#### Annotations
http://symfony.com/doc/current/reference/constraints/Image.html

### Form
```
use Symfony\Component\Form\Extension\Core\Type\FileType;

class TeamFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('logo', FileType::class, array('label'=>'Team Logo Image'));
    }
```

### View
```
<div class="item form-group">
    {{ form_label(teamForm.logo, 'Logo', { 'label_attr': {'class': 'control-label col-md-3 col-sm-3 col-xs-12'} }) }}
    {{ form_errors(teamForm.logo) }}
    <div class="col-md-6 col-sm-6 col-xs-12">
        {{ form_widget(teamForm.logo) }}
    </div>
</div>
```

### Controller
```
/**
 * @Route("/admin/team/new", name="team_new")
 * @param Request $request
 *
 * @return Response
 */
public function newAction(Request $request)
{
    $team = new Team();
    
    $form = $this->createForm(TeamFormType::class, $team);
    
    // only handles data on POST
    $form->handleRequest($request);
    
    if ($form->isSubmitted() and $form->isValid()) {
        // $file stores the uploaded image file
        /** @var Symfony\Component\HttpFoundation\File\UploadedFile $file */
        $file = $team->getLogo();

        // Generate a unique name for the file before saving it
        $fileName = md5(uniqid()).'.'.$file->guessExtension();

        // Move the file to the directory where brochures are stored
        $file->move(
            $this->getParameter('image_directory'),
            $fileName
        );

        // Update the 'logo' property to store the image file name instead of its contents
        $team->setLogo($fileName);


        $team = $form->getData();
        $em = $this->getDoctrine()->getManager();
        $em->persist($team);
        $em->flush();

        // redirect to prevent double saving
        return $this->redirectToRoute('admin_teams');
    }

    return $this->render('Admin/Team/new.html.twig', [
        'teamForm'=>$form->createView()
    ]);
}
```

### Config.yml
```
parameters:
    locale: en
    image_directory: '%kernel.root_dir%/../web/uploads/images'
```
### Image preview
http://jsbin.com/uboqu3/1/edit?html,js,output
Solution by JS only.
```
view:
<input type='file' onchange="readURL(this);" />
<img id="logo-file" src="#" alt="your image" />

js:
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {

            var reader = new FileReader();

            reader.onload = function (e) {
                $('#logo-file')
                    .attr('src', e.target.result)
                    .width(150);
                $('#logo-file').css("visibility", "visible");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
    
Form builder:
$builder
    ->add('name')
    ->add('logo', FileType::class, array('label'=>'Team Logo Image', 'attr'=>array('onchange' => 'readURL(this);')));
            
            
CSS:
#team_form_logo {
    height: 30px;
}
#logo-file {
    visibility: hidden;
}

```




