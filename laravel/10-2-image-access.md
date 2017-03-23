# Access to uploaded image
Image must be uploaded in storage/public.
Then:
````
php artisan storage:link
````
Access:
````
<img src="{!! asset('storage/' . $image->file) !!}" alt="">
````