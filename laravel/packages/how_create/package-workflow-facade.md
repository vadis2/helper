# Workflow with package
1. Create package class in src
````
namespace Vadiasov\UsersAdmin;

class UserRoles
{
    public function hasRole($userId, $roleName)
    {
        return true;
    }
    
    public function setRole($userId, $roleName)
    {
        return false;
    }
    
}
````
2. Create a facade in src
````
namespace Vadiasov\RolesAdmin;

use Illuminate\Support\Facades\Facade;

class UserRolesFacade extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'user-role';
    }
    
}
````
3. Install tests tools
````
composer require --dev phpunit/phpunit
composer require --dev orchestra/testbench
````

4. Add in main composer.json
````
"autoload-dev": {
        "psr-4": {
            "Vadiasov\\UsersAdmin\\Test\\": "packages/vadiasov/users-admin/tests"
        }
    }
````
5. Create phpunit.xml in package dir (where composer.json)
````
<?xml version="1.0" encoding="UTF-8"?>
<phpunit bootstrap="../../../vendor/autoload.php"
         backupGlobals="false"
         backupStaticAttributes="false"
         colors="true"
         verbose="true"
         convertErrorsToExceptions="true"
         convertNoticesToExceptions="true"
         convertWarningsToExceptions="true"
         processIsolation="false"
         stopOnFailure="false">
    <testsuites>
        <testsuite name="MyPackage Test Suite">
            <directory>tests</directory>
        </testsuite>
    </testsuites>
    <filter>
        <whitelist>
            <directory suffix=".php">src/</directory>
        </whitelist>
    </filter>
</phpunit>
````
6. Create base testcase in tests\TestCase.php
````
namespace Vadiasov\UsersAdmin\Test;

use Vadiasov\UsersAdmin\UsersAdminFacade;
use Vadiasov\UsersAdmin\UserServiceProvider;
use Orchestra\Testbench\TestCase as OrchestraTestCase;

class TestCase extends OrchestraTestCase
{
    /**
     * Load package service provider
     *
     * @param  \Illuminate\Foundation\Application $app
     *
     * @return array
     */
    protected function getPackageProviders($app)
    {
        return [UserServiceProvider::class];
    }
    
    /**
     * Load package alias
     *
     * @param  \Illuminate\Foundation\Application $app
     *
     * @return array
     */
    protected function getPackageAliases($app)
    {
        return [
            'UsersAdmin' => UsersAdminFacade::class,
        ];
    }
}
````
7. Create the actual test
````
namespace Vadiasov\UsersAdmin\Test;

use PHPUnit\Framework\TestCase;
use Vadiasov\UsersAdmin\UsersAdmin;

class UsersAdminFunctionTest extends TestCase
{
    /**
     * Check that the multiply method returns correct result
     * @return void
     */
    public function testHasRoleReturnsCorrectValue()
    {
        $this->assertSame(UsersAdmin::hasRole(1, 1), false);
    }
}
````
8. Run test
````
cd path_to_package (packages/vadiasov/mypackage)
../../../vendor/bin/phpunit
````
9. Test don't work with DB.