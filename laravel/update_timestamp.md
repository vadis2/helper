# Update timestamp if model didn't change
 ````
 $oldRow = Modules_history::where('user_id', $user_id)
             ->where('controller', $controller)
             ->where('action', $action)
             ->first();
 
         if ($oldRow != null) {
             $oldRow->touch();
         }
 ````
