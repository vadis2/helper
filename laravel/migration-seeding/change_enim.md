````
DB::statement("ALTER TABLE tenant_requests MODIFY COLUMN status ENUM('active', 'accepted', 'cancelled', 'denied') NOT NULL");
````