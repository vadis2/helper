# Active menu
## 1
https://github.com/letrunghieu/active
### Usage
https://www.hieule.info/products/laravel-active-version-3-released/

## 2
http://www.krucas.com/2015/07/active-menu-state-using-route-attributes/

## 3
https://laracasts.com/discuss/channels/general-discussion/best-practice-for-handling-active-menu-item-in-l5

This is how I do it. In my controller I set a name and share it to the view

<?php namespace App\Http\Controllers\Admin;

use Auth;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class MyController extends Controller
{
    public function __construct()
    {
        View::share(['page_name_active'=> 'mypagename']);       
    }
    /* rest of logic */
}
And in my view, I check against the respective values and show active

                        <li class="@if($page_name_active=='mypagename')active @endif">
                            <a href="{{route('admin.mypage')}}" >My Page</a>
                        </li>