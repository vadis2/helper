# Get complex pivot
## Controller
````
$workflows = Workflow::with(['organization', 'stages'])->get();
````
## Model
````
// Workflow
public function stages()
{
    return $this->belongsToMany(
        'App\Models\Stage',
        'workflow_stages'
    )
        ->withPivot('order')
        ->withTimestamps();
}
````
