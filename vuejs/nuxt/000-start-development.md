# Start Development
Don't enter any commands except of:
````
yarn dev
````
pm2 is used in production.

## Errors with ports
+ Close terminal with open port
+ Find all opened ports
+ First kill ports for pm
+ Second kill (if it exist) port 4002 
|----------------------------|-------------------------------|
| netstat -nlp VL grep :400* |  VL!!! find used ports        |
| kill -9 xxxxx              |  kill process and free a port |
| npm cache clear --force    |  cache clearing               |
