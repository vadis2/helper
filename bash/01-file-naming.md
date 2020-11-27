# File naming convention
65

. is used to separate a filetype extension, e.g. foo.txt.

- or _ is used to separate logical words, e.g. my-big-file.txt or sometimes my_big_file.txt. - is better because you don't have to press the Shift key (at least with a standard US English PC keyboard), others prefer _ because it looks more like a space.

So if I understand your example, backup-part2-random or backup_part2_random would be closest to the normal Unix convention.

CamelCase is normally not used on Linux/Unix systems. Have a look at file names in /bin and /usr/bin. CamelCase is the exception rather than the rule on Unix and Linux systems.

(NetworkManager is the only example I can think of that uses CamelCase, and it was written by a Mac developer. Many have complained about this choice of name. On Ubuntu, they have actually renamed the script to network-manager.)

For example, on /usr/bin on my system:

$ ls -d [A-Z]* | wc -w    # files starting with a capital
6
$ ls -d *_* | wc -w       # files containing an underscore
178
$ ls -d *-* | wc -w       # files containing a minus/dash
409
and even then, none of the files starting with a capital uses CamelCase:

$ ls -d [A-Z]*
GET  HEAD  POST  X11  Xvnc  Xvnc4
