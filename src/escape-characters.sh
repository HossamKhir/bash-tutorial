#! /bin/bash

# some characters can have special meaning to the terminal, so to differentiate the usages we use escape character '\'
echo Hello      World   # this ignores the indentations

echo "Hello     World"  # this is a single argument, hence the indentation is kept

# to print Hello    "World" with the quotation, whereas the quotation is already a special character, it must be escaped
echo "Hello      \"World\"" # this is a single argument, with escape character, so the quotations are displayed

# but using this will not do as expected
echo "Hello     "World""

# for bash single & double quotes are different, yet both used to enclose strings
# so this could be used to achieve the required result as next
echo 'Hello     "World"'

# most characters are literal when placed within quotes 
# but {", \, $, `}, are not literal and always interpreted
# as mentioned '\' is the escape character to escape sequences to be sent to the terminal

# let's print some special characters
echo "A quote is \", backslash is \\, backtick is \`."

X=5

echo "A few spaces are  , & a dollar is \$, \$X is ${X}"
