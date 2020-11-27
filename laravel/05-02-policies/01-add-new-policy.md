# Add new policy
## Link
[Laravel 7.x Gate and Policy Example From Scratch](https://www.codechief.org/article/laravel-gate-and-policy-example-from-scratch)
## Create new policy
```` 
php artisan make:policy PostPolicy
```` 
## Register the policy in ``app/Providers/AuthServiceProvider.php``
```` 
protected $policies = [
        Post::class => PostPolicy::class,
    ];
```` 
## Edit the policy
```` 
namespace App\Policies;

use App\Post;
use App\User;

class PostPolicy
{
    /**
     * Determine if the given post can be updated by the user.
     *
     * @param  \App\User  $user
     * @param  \App\Post  $post
     * @return bool
     */
    public function update(User $user, Post $post)
    {
        return $user->id === $post->user_id;
    }
}
```` 
## Use in a controller
```` 
if ($user->can('update', $post)) {
    //user is authorized now
}
```` 

## Use in a middleware
```` 
Route::put('/post/{post}', function (Post $post) {
    // The current user may update the post...
})->middleware('can:update,post');

or

Route::post('/post', function () {
    // The current user may create posts...
})->middleware('can:create,App\Post');
```` 
