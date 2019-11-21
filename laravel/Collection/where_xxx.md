````
$projects     = Project::whereIn('bid_id', $userBidsId)
            ->where('status', 'completed')
            ->whereNotIn('id', $portfoliosId)
            ->get();
````