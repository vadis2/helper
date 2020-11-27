# Details
(Details)[https://scribe.readthedocs.io/en/latest/documenting/index.html]
## Grouping endpoints
````
/**
 * @group User management
 *
 * APIs for managing users
 */
class UserController extends Controller
{

	/**
	 * Create a user.
	 */
	 public function createUser()
	 {

	 }
	 
	/**
     * Change a user's password.
     * 
	 * @group Account management
	 */
	 public function changePassword()
	 {

	 }
}
````
## query parameters
````
/**
  * @queryParam sort string Field to sort by. Defaults to 'id'.
  * @queryParam fields required Comma-separated list of fields to include in the response. Example: title,published_at,is_public
  * @queryParam filters[published_at] Filter by date published.
  * @queryParam filters[is_public] integer Filter by whether a post is public or not. Example: 1
 */
````

