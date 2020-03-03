#! /usr/bin/bash

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


