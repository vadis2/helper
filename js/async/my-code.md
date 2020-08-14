### Read file and output it into console log
````
// printer.js
import fs from 'fs';

const print = (path) => {
  const callback = (_error, data) => console.log(data);
  fs.readFile(path, 'utf-8', callback);
};

export default print;
````
### Write into the file and output through given callback
````
// writer.js
import fs from 'fs';

const write = (path, content, func) => {
  const callback = () => fs.writeFile(path, content, func);
  fs.readFile(path, 'utf-8', callback);
};

export default write;
````
###
````
import fs from 'fs';

// BEGIN (write your solution here)
const compareFileSizes = (path1, path2, func) => {
  fs.stat(path1, (_error1, stats1) => {
    fs.stat(path2, (_error2, stats2) => {
      func(_error2, Math.sign(stats1 - stats2));
    });
  });
};

export default compareFileSizes;
````
````
export const compareFileSizes = (filepath1, filepath2, cb) => {
  fs.stat(filepath1, (_error1, { size: size1 }) => {
    fs.stat(filepath2, (_error2, { size: size2 }) => {
      cb(null, Math.sign(size1 - size2));
    });
  });
};
````
### Copy content of one to another file. First file is deleted after all
````
import fs from 'fs';

// BEGIN (write your solution here)
export const move = (pathSrc, pathFin, cb) => {
  fs.readFile(pathSrc, 'utf-8', (errRead, data) => {
    if (errRead) {
      cb(errRead);
      return;
    }
    fs.writeFile(pathFin, data, (errWrite) => {
      if (errWrite) {
        cb(errWrite);
        return;
      }
      fs.unlink(pathSrc, (errUnlink) => {
        cb(errUnlink);
      });
    });
  });
};
// END
````
