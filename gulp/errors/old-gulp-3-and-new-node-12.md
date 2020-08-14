# Old gulp-3 and new node-12
They don't work together.

## How to fix
1. Create npm-shrinkwrap.json in the root (where package.json is)
2. add in npm-shrinkwrap.json
```
{
  "dependencies": {
    "graceful-fs": {
        "version": "4.2.2"
     }
  }
}
```
3. run
```
npm install
```
4. You may run gulp instructions
