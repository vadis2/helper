# Common knowledge
## Links
[CORS](https://developer.mozilla.org/uk/docs/Web/HTTP/CORS#%D0%9F%D1%80%D0%B8%D0%BA%D0%BB%D0%B0%D0%B4%D0%B8_%D1%81%D1%86%D0%B5%D0%BD%D0%B0%D1%80%D1%96%D1%97%D0%B2_%D0%BA%D0%BE%D0%BD%D1%82%D1%80%D0%BE%D0%BB%D1%8E_%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D1%83)

[Top 5 CORS Issues You Don't Want To Run Into](https://dev.to/heytulsiprasad/top-5-cors-issues-you-don-t-want-to-run-into-16hi?utm_source=digest_mailer&utm_medium=email&utm_campaign=digest_email)
## 3 scenarios
### Simple
Without preflight request.
There are restrictions when it is used.
The only allowed values for the Content-Type header are:
````
application/x-www-form-urlencoded
multipart/form-data
text/plain
````
### With preflight request
Request is preflighted if any of the following conditions is true:
If the request uses any of the following methods:
````
PUT
DELETE
CONNECT
OPTIONS
TRACE
PATCH
````
Or if, apart from the headers set automatically by the user agent (for example, Connection, User-Agent, or any of the other header with a name defined in the Fetch spec as a “forbidden header name”), the request includes any headers other than those which the Fetch spec defines as being a “CORS-safelisted request-header”, which are the following:
````
Accept
Accept-Language
Content-Language
Content-Type (but note the additional requirements below)
Last-Event-ID
DPR
Save-Data
Viewport-Width
Width
````
Or if the Content-Type header has a value other than the following:
````
application/x-www-form-urlencoded
multipart/form-data
text/plain
````
Or if one or more event listeners are registered on an XMLHttpRequestUpload object used in the request.
Or if a ReadableStream object is used in the request.
````  
