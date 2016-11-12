# Edit data or Default data
1. Create function
```
use AppBundle\Entity\Genus;

class GenusAdminController extends Controller
{
    /**
     * @Route("/genus/{id}/edit", name="admin_genus_edit")
     */
    public function editAction(Request $request, Genus $genus)
    {
        $form = $this->createForm(GenusFormType::class, $genus);
            
        // only handles data on POST
        $form->handleRequest($request);
        if ($form->isSubmitted() and $form->isValid()) {
            $genus = $form->getData();
    
            $em = $this->getDoctrine()->getManager();
            $em->persist($genus);
            $em->flush();
    
            $this->addFlash('success', 'Genus updated!');
            
            return $this->redirectToRoute('admin_genus_list');
        }

    return $this->render('admin/genus/edit.html.twig', [
        'genusForm' => $form->createView()
    }
}
```
2. add getId
```
class Genus
{
    public function getId()
    {
        return $this->id;
    }
}
```
