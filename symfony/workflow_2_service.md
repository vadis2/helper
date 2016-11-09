#WORKFLOW. 2. Service
## install new service
```
sudo composer require knplabs/knp-markdown-bundle

add in AppKernel:
new Knp\Bundle\MarkdownBundle\KnpMarkdownBundle(),
```
## configuration
app/config/config.yml

### investigation of service config
```
List of services:
./bin/console config:dump-reference

Investigate concrete service
./bin/console config:dump-reference twig
```
