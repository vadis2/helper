# Menu
http://symfony.com/doc/master/bundles/KnpMenuBundle/index.html
## Download
```
composer require knplabs/knp-menu-bundle "^2.0"
```
## Enable the Bundle. AppKernel.php
```
new Knp\Bundle\MenuBundle\KnpMenuBundle(),
```
## Config (if it's needed)
http://symfony.com/doc/master/bundles/KnpMenuBundle/index.html

## Create dir Menu in your bundle

## Create class Builder in Menu
```
// src/AppBundle/Menu/MenuBuilder.php

namespace AppBundle\Menu;

use Knp\Menu\FactoryInterface;

class MenuBuilder
{
    private $factory;

    /**
     * @param FactoryInterface $factory
     *
     * Add any other dependency you need
     */
    public function __construct(FactoryInterface $factory)
    {
        $this->factory = $factory;
    }

    public function createMainMenu(array $options)
    {
        $menu = $this->factory->createItem('root');

        $menu->addChild('Home', array('route' => 'homepage'));
        // ... add more children

        return $menu;
    }
}
```
## register your menu builder as service and register its createMainMenu method as a menu builder
```
# app/config/services.yml
services:
    app.menu_builder:
        class: AppBundle\Menu\MenuBuilder
        arguments: ["@knp_menu.factory"]
        tags:
            - { name: knp_menu.menu_builder, method: createMainMenu, alias: main } # The alias is what is used to retrieve the menu
```
## Change style of ul if it's needed
```
$menu = $this->factory->createItem('root', [
    'childrenAttributes' => [
        'class' => 'nav side-menu',
    ],
]);
```
## Insert icon if needed
vendor/knplabs/knp-menu/src/Knp/Menu/Resources/views/knp_menu.html.twig
```
for example:

{% block linkElement %}{% import _self as knp_menu %}
    <a href="{{ item.uri }}"{{ knp_menu.attributes(item.linkAttributes) }}>
        <i class="{{ item.attribute('icon') }}"></i>
        {{ block('label') }}
    </a>
{% endblock %}
```
