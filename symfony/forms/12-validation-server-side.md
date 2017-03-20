# Validation server side
## Docs
https://symfony.com/doc/current/validation.html

## how to use
1. File Entity
```
use Symfony\Component\Validator\Constraints as Assert;
```
```
/**
 * @Assert\NotBlank()
 * @ORM\Column(type="string")
 */
private $name;

another:

@Assert\Range(min=0, minMessage="Negative species! Come on...")
```
