#! /usr/bin/bash

# in programming, some tasks need to be repeated with slight difference at each time
# hence came the idea of looping, bash has for & while loops

# for loops over a list of values

# the for loop syntax is as follows
for i in 1 2 3 4 5
do
    # always contain the body of the loop inside a do ... done block
    echo "looping... number $i"
done

# the last for was numerical, the next one is mixed (i.e. string literals)
for i in hello 1 * 2 goodbye
do
    echo "looping... i is set to $i"
done

# while loops as long as a certain condition is met
INPUT_STRING="Hello"

# while syntax
while [ "$INPUT_STRING" != "bye" ]
do
    # always contain the body of the loop inside a do ... done block
    echo "Please, type something in (bye to quit)"
    read INPUT_STRING
    echo "You typed: $INPUT_STRING" 
done

# to have an infinite loop (one that can only be broken by keyboard interrupt), use ':'
# while :
# do
#     echo "Please, type something in (^C to quit)"
#     read INPUT_STRING
#     echo "You typed $INPUT_STRING"
# done

# another form for while is with other command
while read word
do
    case $word in
        Hello)  echo "English";;
        howdy)		echo American	;;
        gday)		echo Australian	;;
        bonjour)	echo French	;;
        "guten tag")	echo German	;;
        *)		echo Unknown Language: $word ;;
    esac    # some blocks in bash, like case, must be closed by reversing the keyword
done < myfile   # the '<' operator is for inputing files from the stream
# the operator '>' is used to write files to the file system
# the operator '>>' is used to append to files in the file system

# some commands, can run recursively with the following syntax
mkdir rc{0,1,2,3,4,5,6,S}.d
# this replaces: for i in 0 1 2 3 4 5 6 S ; do mkdir rc${i}.d; done
ls
rmdir *.d 
