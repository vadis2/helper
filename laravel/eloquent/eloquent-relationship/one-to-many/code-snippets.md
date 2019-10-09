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
     * The categoy that belong to the document.
     */
    function category()
        {
            return $this->belongsTo('Models/DocumentCategory');
        }
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
  

