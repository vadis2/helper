# Croppie implementation
## Links
https://foliotek.github.io/Croppie/
https://github.com/foliotek/croppie

## Page with image
1. Add in head
````
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.1.0/croppie.min.css">
<meta name="csrf-token" content="{{ csrf_token() }}">
````
2. Block with image. Add id="upload-demo-i" into a cover of img
````
<div class="col-md-3">
    <div class="box box-info">
        <div class="box-header with-border" style="margin-bottom: 10px">
            <h3 class="box-title">Artist Photo</h3>
        </div>
        <div class="box-body" id="upload-demo-i">
            <img style="margin-left: auto; margin-right: auto; display: block;"
                 src="{{ $artist->profile_picture == '' ? asset('admin/dist/img/avatar5.png') : asset('storage/artists/' . $artist->profile_picture) }}"
                 alt="">
        </div>
        <div class="box-footer">
            <a type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#myModal">
                Change Photo
            </a>
        </div>
    </div>
</div>
````
3. Add modal
* Important: id="upload-demo" for container of future img
* Important: id="upload" for <input type="file" id="upload"> 
````
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Upload and Crop your Picture</h4>
            </div>
            <div class="modal-body">


                <div class="row">
                    <div class="col-md-8 text-center">
                        <div id="upload-demo" style="width:350px">

                        </div>
                    </div>
                    <div class="col-md-4" style="padding-top:30px;">
                        <strong>Select Image:</strong>
                        <br/>
                        <input type="file" id="upload">
                        <br/>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button class="btn btn-success upload-result" data-dismiss="modal">Upload Image</button>
            </div>
        </div>
    </div>
</div>
````
4. Add in js section
````
<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.1.0/croppie.min.js"></script>
<script>
    $('#myModal').modal({
        show: false
    })
</script>
<script type="text/javascript">


    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });


    $uploadCrop = $('#upload-demo').croppie({
        enableExif: true,
        viewport: {
            width: 200,
            height: 200,
            type: 'square'
        },
        boundary: {
            width: 300,
            height: 300
        }
    });


    $('#upload').on('change', function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            $uploadCrop.croppie('bind', {
                url: e.target.result
            }).then(function () {
                console.log('jQuery bind complete');
            });
        }
        reader.readAsDataURL(this.files[0]);
    });


    $('.upload-result').on('click', function (ev) {
        $uploadCrop.croppie('result', {
            type: 'canvas',
            size: 'viewport'
        }).then(function (resp) {
            $.ajax({
                url: "/image-crop/artists/" + "<?php echo $artist->id ?>",
                type: "POST",
                data: {"image": resp},
                success: function (data) {
                    $("#upload-demo-i").html("");
                    html = '<img src="' + resp + '" />';
                    $("#upload-demo-i").html(html);
                }
            });
        });
    });
</script>
````
5. Create Controller
````
namespace App\Http\Controllers;

use App\Artist;
use Illuminate\Http\Request;

class ImageController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function imageCrop()
    {
        return view('imageCrop');
    }
    
    
    /**
     * Show the application dashboard.
     *
     * @param \Illuminate\Http\Request $request
     * @param $table
     * @param $id
     *
     * @return \Illuminate\Http\Response
     */
    public function imageCropPost(Request $request, $table, $id)
    {
        $data = $request->image;
        
        list($type, $data) = explode(';', $data);
        list(, $data) = explode(',', $data);
        
        $data       = base64_decode($data);
        $image_name = 'artist-' . time() . '.png';
        $path       = storage_path() . "/app/public/artists/" . $image_name;
        file_put_contents($path, $data);
    
        $artist = Artist::whereId($id)->first();
        $artist->profile_picture = $image_name;
        $artist->save();
        
        return response()->json(['success' => 'done']);
    }
}
````
6. Add route
````
Route::post('image-crop/{table}/{id}', 'ImageController@imageCropPost');
````
7. Create in storage/app/public artists
````
sudo mkdir storage/app/public/artists
sudo chmod -R 777 storage/app/public/artists
php artisan storage:link
````
8. Create Package.
* config
  ````
  viewport: {
          width: 200,
          height: 200,
          type: 'square'
      },
      boundary: {
          width: 300,
          height: 300
      }
  ````
* Controller to process cropping, save image, create data for DB