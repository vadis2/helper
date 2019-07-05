# How-To
## create array structure
$json=json_encode($array)

Example:
````
$permissions[] = [
                'id'   => $permission->id,
                'name' => $permission->name
            ];
            
$arr = [
            'id'          => $role->id,
            'role'        => $role->role,
            'permissions' => $permissions,
            'created_at'  => $role->created_at,
            'updated_at'  => $role->updated_at,
        ];
        
$res = [
            'success' => true,
            'data'    => $arr,
            'message' => 'Permission-Roles stored successfully.'
        ];
        
$json=json_encode($array)        
````
Result:
````
stdClass Object
(
    [success] => 1
    [data] => stdClass Object
        (
            [id] => 14
            [role] => Test Role
            [permissions] => Array
                (
                    [0] => stdClass Object
                        (
                            [id] => 6
                            [name] => New Test Permission 1
                        )

                    [1] => stdClass Object
                        (
                            [id] => 7
                            [name] => New Test Permission 2
                        )

                    [2] => stdClass Object
                        (
                            [id] => 8
                            [name] => New Test Permission 3
                        )

                )

            [created_at] => 2019-07-04T06:45:17.000000Z
            [updated_at] => 2019-07-04T06:45:17.000000Z
        )

    [message] => Permission-Roles stored successfully.
)
````
Structure for assertJsonStructure:
````
$response->assertJsonStructure(
            [
                'success',
                'data' =>
                    [
                        'id',
                        'role',
                        'permissions' =>
                            [
                                [
                                    'id',
                                    'name'
                                ]
                            ],
                        'created_at',
                        'updated_at'
                    ],
                'message'
            ]
        );
````
To get 'data':
````
$data      = $response->getData();
$data_data = $data->data;
print_r($data_data);

````