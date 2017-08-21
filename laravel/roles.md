# Roles
## Link
https://medium.com/@ezp127/laravel-5-4-native-user-authentication-role-authorization-3dbae4049c8a

## Content
Laravel 5.4 native User Authentication + Role Authorization
A very brief step-by-step of how to implement a native Laravel 5.4 user authentication + role authorization. I hope this can help you.
Starting from a fresh Laravel 5.4 installation, run the php artisan to create the Auth resource:
$ php artisan make:auth
Create the Role model with his respective migration (-m parameter):
$ php artisan make:model Role -m
Edit the CreateRolesTable class in the migrations folder:
public function up()
{
  Schema::create(‘roles’, function (Blueprint $table) {
    $table->increments(‘id’);
    $table->string(‘name’);
    $table->string(‘description’);
    $table->timestamps();
  });
}
public function down()
{
  Schema::dropIfExists(‘roles’);
}
Create a new migration for the role_user pivot table :
$ php artisan make:migration create_role_user_table
Edit the CreateRoleUserTable class in the migrations folder:
public function up()
{
  Schema::create(‘role_user’, function (Blueprint $table) {
    $table->increments(‘id’);
    $table->integer(‘role_id’)->unsigned();
    $table->integer(‘user_id’)->unsigned();
    $table->timestamps();
  });
}
public function down()
{
  Schema::dropIfExists(‘role_user’);
}
Now let’s provide a many-to-many relationship between User and Role.
Open the User.php model and add the following method:
public function roles()
{
  return $this
    ->belongsToMany(‘App\Role’)
    ->withTimestamps();
}
Do the same with Role.php model:
public function users()
{
  return $this
    ->belongsToMany(‘App\User’)
    ->withTimestamps();
}
It’s time to create some seeders to add roles and users in the database:
$ php artisan make:seed RoleTableSeeder
$ php artisan make:seed UserTableSeeder
Edit the RoleTableSeeder class (database/seeds/ folder) adding the following code in the run() method:
use Illuminate\Database\Seeder;
use App\Role;
class RoleTableSeeder extends Seeder
{
  public function run()
  {
    $role_employee = new Role();
    $role_employee->name = ‘employee’;
    $role_employee->description = ‘A Employee User’;
    $role_employee->save();
    $role_manager = new Role();
    $role_manager->name = ‘manager’;
    $role_manager->description = ‘A Manager User’;
    $role_manager->save();
  }
}
Do the same with UserTableSeeder class:
use Illuminate\Database\Seeder;
use App\User;
use App\Role;
class UserTableSeeder extends Seeder
{
  public function run()
  {
    $role_employee = Role::where(‘name’, ‘employee’)->first();
    $role_manager  = Role::where(‘name’, ‘manager’)->first();
    $employee = new User();
    $employee->name = ‘Employee Name’;
    $employee->email = ‘employee@example.com’;
    $employee->password = bcrypt(‘secret’);
    $employee->save();
    $employee->roles()->attach($role_employee);
    $manager = new User();
    $manager->name = ‘Manager Name’;
    $manager->email = ‘manager@example.com’;
    $manager->password = bcrypt(‘secret’);
    $manager->save();
    $manager->roles()->attach($role_manager);
  }
}
Edit the DatabaseSeeder class (database/seeds/ folder) adding the following code in the run() method:
public function run()
{
  // Role comes before User seeder here.
  $this->call(RoleTableSeeder::class);
  // User seeder will use the roles above created.
  $this->call(UserTableSeeder::class);
}
Almost done! Don’t give up! ^^ Let’s run the migrations with the seed parameter:
$ php artisan migrate:refresh --seed
Open the User.php model and add these three tiny methods:
public function authorizeRoles($roles)
{
  if ($this->hasAnyRole($roles)) {
    return true;
  }
  abort(401, 'This action is unauthorized.');
}
public function hasAnyRole($roles)
{
  if (is_array($roles)) {
    foreach ($roles as $role) {
      if ($this->hasRole($role)) {
        return true;
      }
    }
  } else {
    if ($this->hasRole($roles)) {
      return true;
    }
  }
  return false;
}
public function hasRole($role)
{
  if ($this->roles()->where(‘name’, $role)->first()) {
    return true;
  }
  return false;
}
Open the app/Http/Controllers/Auth/RegisterController.php file and change the create() method to set a default Role for new Users:
use App\Role;
class RegisterController ...
protected function create(array $data)
  {
    $user = User::create([
      'name'     => $data['name'],
      'email'    => $data['email'],
      'password' => bcrypt($data['password']),
    ]);
    $user
       ->roles()
       ->attach(Role::where('name', 'employee')->first());
    return $user;
}
Finally the final step! Now, all you need to do is call the User authorizeRoles() method inside your Controllers Actions and pass an array with the user roles you want to grant access.
class HomeController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth');
  }
  public function index(Request $request)
  {
    $request->user()->authorizeRoles(['employee', 'manager']);
    return view(‘home’);
  }
  /*
  public function someAdminStuff(Request $request)
  {
    $request->user()->authorizeRoles('manager');
    return view(‘some.view’);
  }
  */
}
After this point, just proceed with the normal development flow. Build a interface CRUD to manage roles and assign them to the users.