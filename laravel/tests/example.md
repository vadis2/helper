https://semaphoreci.com/community/tutorials/getting-started-with-phpunit-in-laravel

Terminal commands:
````
pa make:test ExampleTest --Unit
or
pa make:test ExampleTest //для Feature
````
start:
````
vendor/bin/phpunit
````

Assertions
````
assertTrue()
assertFalse()
assertEquals()
assertNull()
assertContains()
assertCount()
assertEmpty()
````

````
class ServiceAreaDecodeTest extends TestCase
{
    public function testExample2()
    {
        $serviceAreasArray = [10002, '100**', 100004];
        $result = ServiceArea::decode($serviceAreasArray);
        $this->assertCount(3, $result);
        $this->assertContains(['10000','10099'], $result);
        $this->assertContains(10002, $result);
        $this->assertContains(100004, $result);
    }

    public function testExample3()
    {
        $serviceAreasArray = [];
        $result = ServiceArea::decode($serviceAreasArray);
        $this->assertCount(0, $result);
        $this->assertEmpty($result);
    }
}
````