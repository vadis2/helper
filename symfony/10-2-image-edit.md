# Image edit
## controller
```
/**
 * @Route("/admin/team/{id}/edit", name="admin_team_edit")
 * @param Request $request
 * @param Team    $team
 *
 * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
 */
public function editAction(Request $request, Team $team)
{
    $imageName = $team->getLogo();
    
    // transform logo from string to file
    $team->setLogo(
        new File($this->getParameter('image_directory') . '/' . $team->getLogo())
    );
    
    $form = $this->createForm(TeamFormType::class, $team);
    
    // only handles data on POST
    $form->handleRequest($request);
    if ($form->isSubmitted() and $form->isValid()) {
        // $file stores the uploaded image file
        /** @var Symfony\Component\HttpFoundation\File\UploadedFile $file */
        $file = $team->getLogo();
        
        if ($file !== NULL) {
            // Generate a unique name for the file before saving it
            $fileName = md5(uniqid()) . '.' . $file->guessExtension();
                            
            // Move the file to the directory where brochures are stored
            $file->move(
                $this->getParameter('image_directory'),
                $fileName
            );
            
            // Update the 'logo' property to store the image file name instead of its contents
            $team->setLogo($fileName);
        }
        
        $team = $form->getData();

        if ($file === NULL) {
            $team->setLogo($imageName);
        }
        
        $em   = $this->getDoctrine()->getManager();
        $em->flush();
        
        $this->addFlash('success', 'Team updated!');
        
        // redirect to prevent double saving
        return $this->redirectToRoute('admin_teams');
    }
    
    return $this->render('Admin/Team/edit.html.twig', [
        'teamForm'  => $form->createView(),
        'imageName' => $imageName,
    ]);
}
```
## view
```
<div class="item form-group">
    {{ form_label(teamForm.logo, 'Logo', { 'label_attr': {'class': 'control-label col-md-3 col-sm-3 col-xs-12'} }) }}
    {{ form_errors(teamForm.logo) }}
    <div class="col-md-6 col-sm-6 col-xs-12">
        {{ form_widget(teamForm.logo) }}
        {#<img id="logo-file-edit" src="{{ imageName }}" alt="logo" />#}
        <img id="logo-file-edit" src="{{ asset('uploads/images/') }}{{ imageName }}" alt="">
    </div>
</div>
```

## js script
```
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
    
            var reader = new FileReader();
    
            reader.onload = function (e) {
                $('#logo-file-edit')
                    .attr('src', e.target.result)
                    .width(150);
            };
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    </script>
```
## css
```
#logo-file-edit {
    width: 150px;
}
```

