# How trigger language
https://stackoverflow.com/questions/43118230/datatables-js-multiple-customized-languages
## how get segment from url
````
var URL='example.com/event/14aD9Uxp?p=10';

var arr=URL.split('/');//arr[0]='example.com'
                       //arr[1]='event'
                       //arr[2]='14aD9Uxp?p=10'

var parameter=arr[arr.length-1].split('?');//parameter[0]='14aD9Uxp'
                                           //parameter[1]='p=10'

var p_value=parameter[1].split('=')[1];//p_value='10';
````

Our case:
````
var URL='example.com/eng/admin/currencies';

var arr=URL.split('/');//arr[0]='example.com'
                       //arr[1]='eng'
                       //arr[2]='admin'
                       //arr[3]='currencies'

var lang=arr[1];
````
## how get url
````
var URL = window.location.href;

var arr=URL.split('/');//arr[0]='http:'
                       //arr[1]=''
                       //arr[2]='example.com'
                       //arr[3]='eng'
                       //arr[3]='admin'
                       //arr[4]='currencies'

var lang=arr[3];
console.log(lang);
````