#! /bin/bash

# functions can return values in various ways
# change state of variable(s)
# use "exit" command to end the shell script
# use "return" to end the function & return the value to the calling section of the script
# echo o/p to stdout

# simple script with simple function
# simple function
add_a_user()    # a function identifier always ends in ()
{
    # body of the function starts here
    USER=$1         # first argument is the user name
    PASSWORD=$2     # second argument is the user password
    shift; shift;   # shifting the order of arguments, keeping the remaining as comments
    COMMENTS=$@
    echo "Adding user $USER..."
    echo useradd -c "$COMMENTS" $USER
    echo passwd $USER $PASSWORD
    echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
    # body of the function ends here
}

# main body of script
echo "Start of the script..."
add_a_user bob letmein Bob Holness the presenter
add_a_user fred badpassword Fred Durst the singer
add_a_user bilko worsepassword Sgt. Bilko the role model
echo "End of script..."

# scope of variables in bash is... non-existant
# check the next snippets of code, value of x changes inside the function
# but such change is reflected outside function body

myfunc()
{
    echo "I was called as: $@"
    x=2
}

echo "Script was called with $@"
x=1
echo "x is $x"
myfunc 1 2 3
echo "x is $x"  # expected to be 1, if there was a scope

# calling a function and piping '|' its o/p; gets it run in a sub-shell
# functions cannot change the value of their parameters, but must change the actual variable instead

newfunc()
{
    echo "\$1 is $1"
    echo "\$2 is $2"
    # cannot change $1 - we'd have to say:
    # 1="Goodbye Cruel"
    # which is not a valid syntax. However, we can change
    # the original variable: $a
    a="Goodbye Cruel"
}

a=Hello
b=World
newfunc $a $b
echo "a is $a"
echo "b is $b"

# recursion
factorial()
{
    if [ "$1" -gt "1" ]
    then
        i=`expr $1 - 1`
        j=`factorial $i`
        k=`expr $1 \* $j`
        echo $k
    else
        echo 1
    fi
}
x=1
while [ $x != "0" ]
do
    echo -n "Enter a number: "
    read x
    factorial $x
done

# include a library 
. ./common.lib
# accessing a common variable
echo $STD_MSG
# calling common functions
rename .txt .bak

# "return" call
adduser()
{
    USER=$1
    PASSWORD=$2
    shift; shift;
    COMMENTS=$@
    useradd -c "${COMMENTS}" $USER
    if [ "$?" -ne "0" ]
    then
        echo "useradd failed"
        return 1
    fi
    passwd $USER $PASSWORD
    if [ "$?" -ne "0" ]
    then
        echo "Setting password failed"
        return 2
    fi
    echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
}

adduser bob letmein Bob Holness from Blockbusters
ADDUSER_RETURN_CODE=$?
if [ $ADDUSER_RETURN_CODE -eq "1" ]
then
    echo "Something went wrong with useradd"
elif [ $ADDUSER_RETURN_CODE -eq "2" ]
then
    echo "Something went wrong with passwd"
else
    "Bob Holness added to the system"
fi

# the value of $? changes with each command, hence the need to store its value into ADDUSER_RETURN_CODE