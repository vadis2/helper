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
        return $this->hasMany('Models/Documents');
    }
````

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

