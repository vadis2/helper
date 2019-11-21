# How to delete foreign keys 
````
public function down()
{
    Schema::dropIfExists('user_roles', function (Blueprint $table) {
        $table->dropForeign(['user_id']);
        $table->dropForeign(['role_id']);
    });
}
````