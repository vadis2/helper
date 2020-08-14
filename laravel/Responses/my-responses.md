# My Responses
## Create Traits
1. create App\Traits
2. create file Responses.php
````
<?php

namespace App\Traits;


trait Responses
{
    public function resp($code, $pre = null, $data = null)
    {
        switch ($code) {
            case 200:
                $response = [
                    'success' => true,
                    'code'    => 200,
                    'message' => $pre . '. Result is successful.',
                    'data'    => $data
                ];
                break;

            case 456:
                $response = [
                    'success' => false,
                    'code'    => 456,
                    'message' => $pre . '. Incorrect ID in URL.',
                    'data'    => null
                ];
                break;

            default:
                $response = [
                    'success' => false,
                    'code'    => $code,
                    'message' => $pre . '. Result is unknown.',
                    'data'    => $data
                ];
        }

        return $response;
    }

}
````
3.In controller
````
use App\Traits\Responses;

class UserDetailsController extends Controller
{
    ...
    use Responses;

public function show() {
  ...
  return response()->json($this->resp(456, 'UserDetails.show'), 456);
  ...
}
````
