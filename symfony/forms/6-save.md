# Save
```
class GenusAdminController extends Controller
{
    public function newAction(Request $request)
    {
        if ($form->isSubmitted() && $form->isValid()) {
            $genus = $form->getData();
            $em = $this->getDoctrine()->getManager();
            $em->persist($genus);
            $em->flush();
            
            // redirect to prevent double saving
            return $this->redirectToRoute('admin_genus_list');
        }
    }
}
```