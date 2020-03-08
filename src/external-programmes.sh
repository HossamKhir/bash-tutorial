#! /bin/bash

# external programmes usually used in shell scripts
# most commands like (echo, which, test, etc.) are built-in
# other commands are unix utilities, like (tr, grep, expr, cut, etc)

# read full name from /etc/passwd & assign it to a variable
MYNAME=`grep "^${USER}:" /etc/passwd | cut -d : -f5`
echo $MYNAME

# backtick "`" is useful to capture command o/p from any terminal
# it can also improve performance
find / -name "*.html" -print | grep "/index.html$"
find / -name "*.html" -print | grep "/contents.html$"
# that can be:
HTML_FILES=`find / -name "*.html" -print`
echo "$HTML_FILES" | grep "/index.html$"
echo "$HTML_FILES" | grep "/contents.html$"
