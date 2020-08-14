# Hot Module Reload
Useful when:
* development a heavyweight page (fast reloading)
* in multi steps form to keep inserted data

Add this in the src/index.js
```
if (module.hot) {
     module.hot.accept();
   }
```
