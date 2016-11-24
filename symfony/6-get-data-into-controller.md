# Get data into controller
## Repository
```
use TeamBundle\Entity\Team;

/**
 * TeamRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 *
 * @return Team[]
 */
public function findAllPublishedOrderedBySize()
{
    return $this->createQueryBuilder('genus')
        ->andWhere('genus.isPublished = :isPublished')
        ->setParameter('isPublished', true)
        ->orderBy('genus.speciesCount', 'DESC')
        ->getQuery()
        ->execute();
}
```
## Controller
```
$em = $this->getDoctrine()->getManager();
$teams = $em->getRepository('TeamBundle:Team')
            ->findAllOrderedByName();
//        dump($teams);
//        die();
        return new Response(...);
```