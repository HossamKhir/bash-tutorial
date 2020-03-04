#! /usr/bin/bash

# white spaces are a great deal in bash script, absence of them, or presence, where should not, causes the programme to
# malfunction, or even crash

# test is a comparison utility
# test is a shell built in command, usually refered to as '[', it is then called with if & while to 'test' conditions

type [

which [

ls -l /usr/bin/[

ls -l /usr/bin/test 

# bash uses command line arguments as comparing operators
# -eq : ==
# -lt : <
# -gt : >
# -le : <=
# -ge : >=
# -ne : !=

# conditionals
if [ "$X" -lt "0" ]
then    # each if or elif must always be followed by then
  echo "X is less than zero"
fi  # if statement is another block that requires reversing the keyword to close a block (like case ... esac) 

# semicolons ':' can be used as separators, for combining commands and keywords into one line
if [ "$X" -gt "0" ]; then
  echo "X is more than zero"
fi

# backslash can be used beyond being the escape character
# it can tell in a script that a certain line is spanned onto the next
[ $X -le "0" ] && \
    echo "X is less than or equal to 0"
[ "$X" -ge "0" ] && \
      echo "X is more than or equal to zero"
# within the square brackets "[]", the '=' operator is in fact equality operator, not assignment
[ "$X" = "0" ] && \
      echo "X is the string or number \"0\""
# string comparison is available too
[ "$X" = "hello" ] && \
      echo "X matches the string \"hello\""
[ "$X" != "hello" ] && \
      echo "X is not the string \"hello\""
# test can take command line arguments, and act upon it: 
[ -n "$X" ] && \
      echo "X is of nonzero length"
[ -f "$X" ] && \
      echo "X is the path of a real file" || \
      echo "No such file: $X"
[ -x "$X" ] && \
      echo "X is the path of an executable file"
[ "$X" -nt "/etc/passwd" ] && \
      echo "X is a file which is newer than /etc/passwd"