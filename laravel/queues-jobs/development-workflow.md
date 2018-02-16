# Drivers
1. config/queue.php
````
'default' => env('QUEUE_DRIVER', 'database'),
````
2. .env
````
QUEUE_DRIVER=database
````
# Create DB tables
````
pa queue:table
pa migrate
````
# Create Job class
````
<?php

namespace App\Jobs;

use App\UnitPhoto;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class ProcessImageThumbnails implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    
    protected $image;
    
    /**
     * Create a new job instance.
     *
     * @param \App\UnitPhoto $image
     */
    public function __construct(UnitPhoto $image)
    {
        $this->image = $image;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // access the model in the queue for processing
        $image = $this->image;
        $full_image_path=storage_path('app/public/' . $image->file);
        $resized_image_path = storage_path('app/public/thumbs' . DIRECTORY_SEPARATOR . $image->file);
        
        // create image thumbs from the original image
        $img = \Image::make($full_image_path)->resize(300, 200);
        $img->save($resized_image_path);
    
        $image->processed = 1;
        $image->save();
    }
}
````
# Actions in Controller
````
// defer the processing of the image thumbnails
            $job = (new ProcessImageThumbnails($image))->delay(Carbon::now()->addSeconds(30));
//            ProcessImageThumbnails::dispatch($image);
            $this->dispatch($job);
````
# Create Supervisor
````
cd /etc/supervisor/conf.d

if there is not:
apt-get install supervisor

sudo nano laravel-worker.conf

Insert:
[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /usr/share/nginx/dhh.com/dhh/dhh/artisan queue:work database --sleep=3 --tries=3 --daemon
autostart=true
autorestart=true
user=root
numprocs=8
redirect_stderr=true
stdout_logfile=/usr/share/nginx/dhh.com/dhh/dhh/storage/logs/laravel.log

Start:
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-worker:*

Stop:
sudo supervisorctl stop laravel-worker:*
````


