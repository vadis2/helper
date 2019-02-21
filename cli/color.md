# How to color 
http://blog.lenss.nl/2012/05/adding-colors-to-php-cli-script-output/
````
Black 0;30
Blue 0;34
Green 0;32
Cyan 0;36
Red 0;31
Purple 0;35
Brown 0;33
Light Gray 0;37 
Dark Gray 1;30
Light Blue 1;34
Light Green 1;32
Light Cyan 1;36
Light Red 1;31
Light Purple 1;35
Yellow 1;33
White 1;37
````
````
echo "\033[31m some colored text \033[0m some white text \n";
echo "\033[<<<red_code>>>m some colored text \033[0m some white text \n";
````