# ERRORS
## var/cache/dev is not writable
## var/session/dev ... permission denied
## Script Sensio\Bundle\DistributionBundle\Composer\ScriptHandler::clearCache handling the symfony-scripts event terminated with an exception

### link
http://symfony.com/doc/current/setup/file_permissions.html
### solution
```
HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
# if this doesn't work, try adding `-n` option
$ sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX var
$ sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX var
```
