#! /bin/bash

# white spaces are a great deal in bash script, absence of them, or presence, where should not, causes the programme to
# malfunction, or even crash

# test is a comparison utility
# test is a shell built in command, usually refered to as '[', it is then called with if & while to 'test' conditions

type [

which [

ls -l /usr/bin/[

ls -l /usr/bin/test 

# bash uses command line arguments as comparing operators
# integer comparisons
#   -eq : ==
#   -lt : <
#   -gt : >
#   -le : <=
#   -ge : >=
#   -ne : !=
# other non-numeric comparisons
#   -nt : newer than
#   -ot : older than
#   -ef : equal file path?
#   -f  : file path exist?
#   -X  : file executable?
#   -n  : non-zero length variable?
#   -z  : zero length variable?
#   -a  : file exist?
#   -e  : file exist?
#   -S  : file is socket?
#   -O  : owned by user

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
# the '&&' is used to combine commands
# [ test_condition ] && <true_command> || <false_command>
# | is used for piping, sending the output of the last command to the next one
# command0 | command1
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

# using if...elif...else... is preferred for readability
# using [...] is for while loops & trivial checks 

# to avoid some errors like wrong data types, some checks must be done before operating on variables
echo -en "Please guess the magic number: "
read X
echo $X | grep "[^0-9]" > /dev/null 2>&1
# grep is a command used for search
# grep [0-9]:   looks for all lines that might contain the digits form 0 to 9 & other characters as well
# grep [^0-9]:  looks for lines that does not contain numbers
# > /dev/null:  directs any o/p or errors to the null device instead of the terminal
if [ "$?" -eq "0" ]; then
  # If the grep found something other than 0-9
  # then it's not an integer.
  echo "Sorry, wanted a number"
else
  # The grep found only 0-9, so it's an integer. 
  # We can safely do a test on it.
  if [ "$X" -eq "7" ]; then
    echo "You entered the magic number!"
  fi
fi

# using test with while loops
X=0
while [ -n "$X" ]
do
    echo "Enter some text (RETURN to quit)"
    read X
    # the next if is to avoid untidy ending of the loop
    if [ -n "$X" ]
    then
        echo "You said: $X"
    fi
done
