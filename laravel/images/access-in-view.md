````
<img style="margin-left: auto; margin-right: auto; display: block;"
src="{!! $user->photo != '' ? asset('storage/users/' . $user->photo) : asset('admin/production/images/user.png') !!}"
alt="">
````