# sync, attach, detach
1. Use 
````
$method  = Method::find($id);
````
to sync: 
````
$method->roles()->sync($role_ids_arr);
````
2.Clear input array ````$role_ids_arr````, keep only 1 value:
````
$role_ids_arr = [];
foreach ($roleIds as $item) {
    $role_ids_arr[] = $item['id'];
}
````
