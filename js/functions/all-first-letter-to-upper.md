````
import { length, toUpperCase } from './strings';

// BEGIN (write your solution here)
function first(s) {
  return toUpperCase(s.charAt(0)) + s.slice(1);
}

function solution(str) {
  const l = length(str);
  const arr = str.split('');

  const newArr = [];

  for (let i = 0; i < l; i += 1) {
    if (i === 0) {
      newArr[0] = toUpperCase(arr[0]);
    } else if (arr[i - 1] === ' ') {
      newArr[i] = first(arr[i]);
    } else {
      newArr[i] = arr[i];
    }
  }

  return newArr.join('');
}

export default solution;
````
