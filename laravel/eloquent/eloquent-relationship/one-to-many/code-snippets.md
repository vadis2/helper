# Objects
* Documents
* Categories

# Model Category
````
/**
     * The documents that belong to the category.
     */
    function documents()
    {
        return $this->hasMany('Models/Document', 'category_id');
    }
````
category_id is the name of the foreign key in DB table "documents". 

# Model Document
````
/**
 * The category that belong to the document.
 */
function category()
    {
        return $this->belongsTo('Models/DocumentCategory');
    }
````

# Use in controller
````
$files = File::with('user')
    ->whereOwnerObjectType('customer')
    ->whereOwnerObjectId($customerId)
    ->get();
````

# Getting
To get documents:
````
$category->documents
````

To use as function:
````
$document = $category->documents()->where('title', 'foo')->first();
````
  

