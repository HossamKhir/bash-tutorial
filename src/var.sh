#! /bin/bash

# dealing with variables with bash is quite sensitive
# there cannot be any spaces between assignment operator or any of the operands
# VAR=value is the right syntax, otherwise isn't
MY_MESSAGE="Hello World"

echo $MY_MESSAGE	# the '$' is used to collect the value within the variable

# it is good practice to name the variables in bash with all caps

# according to bash, there is no data types for variables, any variable can hold just about any data type
# but still, operations between variables do care for data types

# to prompt the user to set a value, use the read command

echo "What is your name?"
read MY_NAME
echo "Hello $MY_NAME: Hope you are well."

# variables in bash does not require any declaration
# but if you try to access an undefined variable, you get no errors, just an empty string

# use curly braces "{}" to use the variable's value towards a larger end

# echo "I will create you a file named $MY_NAME_file" # this will not work, as the script translates "MY_NAME_file" as a variable
echo "I will create you a file named ${MY_NAME}_file"
touch "${MY_NAME}_file"   # touch is the command to create files

# as a script starts running, the first line spawns a new shell to run the script, thus any variable before it is outside its scope
# the keyword 'export' has an effect on variables' scopes, as it exports the variable to be inherited by another programme
# though the variable could now be seen by the script programme, any changes to it are limited by the programme's scope
# once the programme concludes, its environment is destroyed, along with any changes to an exported variable

# run in terminal
#   MYVAR='Hi'; export MYVAR; ./var.sh; echo $MYVAR

echo "MYVAR is: $MYVAR"
MYVAR='hello there'
echo "MYVAR is: $MYVAR"

# to keep changes from a script to the interactive shell, the script must be sourced, by calling it preceeded by a dot '.'

# run in terminal
#   MYVAR='Hi'; echo $MYVAR; . ./var.sh; echo $MYVAR;

# predefined variables:
# $0:   holds the name of the programme being executed
# $1...$9:  hold the additional parameters called with the programme
# $@:   holds all the parameters
# $*:   holds all parameters, execluding whitespace & quotations
# $#:   holds the number of the parameters

echo "I was called with $# parameters"
echo "My name is `basename $0`"
echo "My first parameter is $1"
echo "My second parameter is $2"
echo "All parameters are $@"

# in case the programme received more than 9 parameters, we can call shift command
# 'shift' command keeps shifting the parameter list until $# becomes 0

while [ $# -gt "0" ]
do
    echo "\$1 is $1"
    shift
done 

# the $? variable holds the exit value of the last programme that run
# check this quote:
# One of the main causes of the fall of the Roman Empire was that,
# lacking zero,
# they had no way to indicate successful termination of their C Programs

/usr/local/bin/my-command 
if [ $? -ne "0" ]
then
    echo "Sorry, we had a problem there!"
fi

# $$:   process ID of the current running shell
# $1:   process ID of the last run background process

# IFS:  Internal Field Separator, the default value in it is "SPACE TAB NEWLINE"
# it is advised to copy this variable's value before altering it, and resetting it afterwards
old_IFS="$IFS"
IFS=:
echo "Please input some data separated by colons..."
read x y z
IFS="$old_IFS"
echo "x is $x, y is $y, z is $z"

# echo can be called with parameter -n, to disable automatic linebreak
echo -n "Enter your name: "
read name
echo "Hello, $name"
# some systems use echo \c
echo "Enter your name: \c"
read name
echo "Hello, $name"

# to overcome such folly and futility in the design
if [ "`echo -n`" = '-n' ]
then
    n=""
    c="\c"
else
    n="-n"
    c=""
fi

echo $n Enter your name: $c
read name
echo "Hello, $name"

# `command` indicate that the command enclosed is a command to be executed, and it catches that command

# accepting default value
echo -en "What is your name: [ `whoami` ] "
read name
if [ -z "$name" ]
then
    name=`whoami`
fi
echo "Your name is: $name"

# the same previous assignemt can be done using special feature of the shell: ':-'
echo -en "What is your name: [ `whoami` ] "
read name
echo "Your name is: ${name:-`whoami`}"

# the last one is special case, using the o/p of whoami which is the login name 'UID'
# a more generic approach
echo -en "What is your name: [ John Doe ] "
read name
echo "Your name is: ${name:-John Doe}"

# setting a default value for undefined variables: using ":="
