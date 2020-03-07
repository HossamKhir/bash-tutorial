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
