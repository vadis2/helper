#PHP class
````
/**
 * Controller to operate with customers
 *
 * @category Controller
 * @package  Customers
 * @author   Volodymyr Vadiasov <vadiasov.volodymyr@gmail.com>
 * @license  https://opensource.org/licenses/CDDL-1.0 CDDL-1.0
 * @link     Controller
 * @group    Customers
 */
````
````
/**
 * Migration to create lead_sources table
 *
 * @category Migration
 * @package  LeadSources
 * @author   Volodymyr Vadiasov <vadiasov.volodymyr@gmail.com>
 * @license  https://opensource.org/licenses/CDDL-1.0 CDDL-1.0
 * @link     Migration
 */
````
````
/**
 * Request validation of storing of new lead_source
 *
 * @category RequestValidation
 * @package  LeadSources
 * @author   Volodymyr Vadiasov <vadiasov.volodymyr@gmail.com>
 * @license  https://opensource.org/licenses/CDDL-1.0 CDDL-1.0
 * @link     RequestValidation
 */
````
````
/**
 * Model App\Models\Role
 *
 * @category Model
 * @package  LeadSourceCategoriess
 * @author   Volodymyr Vadiasov <vadiasov.volodymyr@gmail.com>
 * @license  https://opensource.org/licenses/CDDL-1.0 CDDL-1.0
 * @link     Model
 *                    
 * @method static Builder|Role newModelQuery()
 * @method static Builder|Role newQuery()
 * @method static Builder|Role query()
 * @method static Builder|Role whereCreatedAt($value)
 * @method static Builder|Role whereDescription($value)
 * @method static Builder|Role whereId($value)
 * @method static Builder|Role whereName($value)
 * @method static Builder|Role whereUpdatedAt($value)
 * @method static bool|null forceDelete()
 * @method static \Illuminate\Database\Query\Builder|Role onlyTrashed()
 * @method static bool|null restore()
 * @method static \Illuminate\Database\Query\Builder|Role withTrashed()
 * @method static \Illuminate\Database\Query\Builder|Role withoutTrashed()
 * @method static Builder|Role whereDeletedAt($value)
 *                    
 * @mixin \Eloquent
 *                         
 * @property int         $id
 * @property string      $name
 * @property string      $description
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property Carbon|null $deleted_at
 *                                               
 * @property-read Collection|User[]   $users
 * @property-read Collection|Method[] $methods
 */
````
````
/**
 * Seeder for lead_sources table
 *
 * @category Seed
 * @package  LeadSources
 * @author   Volodymyr Vadiasov <vadiasov.volodymyr@gmail.com>
 * @license  https://opensource.org/licenses/CDDL-1.0 CDDL-1.0
 * @link     Seed
 */
````

