````
^ and $ are the beginning and end of the string anchors respectively
\d matches a digit
[a-zA-Z] matches a letter
[a-zA-Z\d] matches a letter or a digit
* is "zero-or-more" repetition
With these, we can now compose the regex we need (see on rubular.com):

^\d*[a-zA-Z][a-zA-Z\d]*$
Here's an explanation of the pattern:

from the beginning...  till the end
|                      |
^\d*[a-zA-Z][a-zA-Z\d]*$
 \_/\______/\_________/
The 3 parts are:

Maybe some digits as a prefix...
But then definitely a letter!
And then maybe some digits and letters as a suffix
````
````
return [
    'user_id'    => 'required',
    'zip'        => ['required', 'regex:/^\d*\**+$/u'],
    'country_id' => 'required',
];
````
````
regex:/^\d*\**+$/u
\------/\----/\--/
1 - syntax command start
2 - core regex
3 - syntax command end

Example:
0125**
````


