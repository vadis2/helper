# Process form
## Step 1
### controller
```
use Symfony\Component\HttpFoundation\Request;

public function newAction(Request $request)
{
    $form = $this->createForm(GenusFormType::class);

    // only handles data on POST
    $form->handleRequest($request);
    if ($form->isSubmitted() and $form->isValid()) {
        dump($form->getData());
        die();
    }

    return $this->render('admin/genus/new.html.twig', [
        'genusForm'=>$form->createView()
    ]);
}
```