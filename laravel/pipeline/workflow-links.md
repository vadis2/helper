# Links
## What it is
https://www.linkedin.com/pulse/pipeline-design-pattern-implementation-laravel5-hossam-youssef/

https://medium.com/@jeffochoa/understanding-laravel-pipelines-a7191f75c351
## Docs

## Development workflow
1. Create in dir app dir "Pipelines"
2. Create App\Traits dir
3. Create MakePipes.php 
````
<?php

namespace App\Traits;


trait MakePipes
{
    public function start($pipes, $data)
    {
        $pipeline = app('Illuminate\Pipeline\Pipeline');
        $pipeline->send($data);
        $pipeline->through($pipes);
        $result = $pipeline->then(function () {
            return 'All tasks have been done';
        });

        return $result;
    }

}
````
4. In Controller

Example: InvitationsController in DHH

````
use App\Traits\MakePipes;

class InvitationsController extends Controller
{
    use MakePipes;

function ... {

...
$pipes = [
            'App\Pipelines\CancelInvitation',
            'App\Pipelines\SendMessageInChat_invitation',
            'App\Pipelines\SendEmail',
        ];

$data = [
    'invitation' => $invitation,
    'message'    => 'Unfortunately, I have to cancel my invitation.',
    'template'   => 'emails.invitation_accepted',
    'userTo'     => User::whereId($invitation->tenant_id)->first(),
    'userFrom'   => User::whereId($invitation->landlord_id)->first(),
    'subject'    => 'My invitation was cancelled',
];

// use trait
$this->start($pipes, $data);
...
}
````
5. Create specific pipe action
````
<?php

namespace App\Pipelines;

use Closure;

class CancelInvitation
{
    /**
     * @param array $data
     * @param \Closure $next
     *
     * @return mixed
     */
    public function handle($data, Closure $next)
    {
        $invitation         = $data['invitation'];
        $invitation->status = 'cancelled';
        $invitation->save();

        $request = $next($data);

        return $request;
    }
}
````