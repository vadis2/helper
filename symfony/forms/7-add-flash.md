# Add flash
```
class GenusAdminController extends Controller
{
    public function newAction(Request $request)
    {
        if ($form->isSubmitted() && $form->isValid()) {
            $this->addFlash('success', 'Genus created!');
            return $this->redirectToRoute('admin_genus_list');
        }
    }
}
```
```
<!DOCTYPE html>
<html>
    <body>
        <div class="main-content">
            {% for msg in app.session.flashBag.get('success') %}
                <div class="alert alert-success">
                    {{ msg }}
                </div>
            {% endfor %}
        </div>
    </body>
</html>
```