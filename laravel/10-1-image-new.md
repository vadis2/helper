# Image
http://symfony.com/doc/current/reference/constraints/Image.html
## newAction
### Entity
```
public function create()
    {
        return view('admin.images.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param ImageFormRequest $request
     * @return \Illuminate\Http\Response
     */
    public function store(ImageFormRequest $request)
    {
        var_dump($_FILES);

        $file = $request->photo;

        var_dump($file);

        $path = $request->photo->store('images');

        var_dump($path);

//        foreach ($request->file('photos') as $photo) {
////            $file->move($destinationPath, '1.png');
//            $path = $photo->store('images');
//            var_dump($path);
//            /*ProductsPhoto::create([
//                'product_id' => $product->id,
//                'filename' => $filename
//            ]);*/
//        }
        die();
        return redirect('admin/images')->with('status', 'Upload successful!');
    }
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
    
CSS:
#team_form_logo {
    height: 30px;
}
#logo-file {
    visibility: hidden;
}

```




