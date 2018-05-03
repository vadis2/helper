````
<img src="{!! ( $client->photo !== null and file_exists(public_path('storage/' . $client->photo))) ? asset('storage/' . $client->photo) : asset('admin/production/images/user.png') !!}"
                                                                     alt="..."
                                                                     class="img-circle profile_img">
````
````
<img style="margin-left: auto; margin-right: auto; display: block;"
src="{!! $user->photo != '' ? asset('storage/users/' . $user->photo) : asset('admin/production/images/user.png') !!}"
alt="">
````
