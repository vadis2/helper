# Installation Local
1. Install library
https://github.com/jenssegers/agent
2. Create route
 ````
Route::get('histories/after_login', 'Admin\HistoriesController@after_login');
 ````
3. Create migration
 ````
 public function up()
     {
         Schema::create('histories', function (Blueprint $table) {
             $table->increments('id');
             $table->integer('user_id')->unsigned();
             $table->string('ip', 30);
             $table->string('browser', 30);
             $table->string('os', 20);
             $table->timestamps();
 
             $table->foreign('user_id')->references('id')->on('users')
                 ->onUpdate('cascade')
                 ->onDelete('cascade');
         });
     }
 
     /**
      * Reverse the migrations.
      *
      * @return void
      */
     public function down()
     {
         Schema::drop('histories');
     }
 ````
4. Create model
 ````
protected $fillable = ['user_id', 'ip', 'browser', 'os'];
 ````
5. Create controller
 ````
 namespace App\Http\Controllers\Admin;
 
 use App\History;
 use Illuminate\Http\Request;
 use App\Http\Controllers\Controller;
 use Illuminate\Support\Facades\Auth;
 use Jenssegers\Agent\Agent;
 
 class HistoriesController extends Controller
 {
     public function index()
     {
 
     }
 
     /**
      * @param Request $request
      * @return \Illuminate\Http\RedirectResponse
      */
     public function after_login(Request $request)
     {
         $user  = Auth::user();
         $agent = new Agent();
 
         $history = new History(array(
             'user_id'    => $user->id,
             'os'         => $agent->platform(),
             'browser'    => $agent->browser(),
             /*'phone'      => $agent->isPhone(),
             'phone_name' => $agent->device(),
             'tablet'     => $agent->isTablet(),
             'desktop'    => $agent->isDesktop(),*/
             'ip'         => $request->ip(),
         ));
 
         $history->save();
 
         return redirect()->route('trigger');
     }
 }
 ````
 6. Change LoginController
 ````
protected $redirectTo = '/histories/after_login';
 ````
 

