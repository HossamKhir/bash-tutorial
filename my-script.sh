#! /bin/sh 

# This is a comment

# tells Unix that this file is to be executed by /bin/sh
# lines starting with '#!' are called directives
echo Hello World	# This is also a comment

# echo is a command to print to the command line, it automatically puts a space between it arguments, which are usually separated by spaces

echo Hello		World	# though there is 2 tabs in between the 2 arguments, they remain arguments and whitespace between them is ignored

echo "Hello		World"	# this one is 1 argument that is a string

echo "Hello * World"

echo Hello * World

echo "Hello" World

echo Hello "	" World 

echo "Hello "*" World"

echo `hello` world

echo 'hello' world