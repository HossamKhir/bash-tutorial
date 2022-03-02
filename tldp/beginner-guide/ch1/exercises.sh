#! /bin/env bash

# where is bash located
which bash

# which version is running
bash --version

# display directory stack content
dirs
# or
echo $DIRSTACK

# display hashed commands
hash

# how many processes running on system
ps | cut -d ' ' -f 3 | wc -w

# display hostname
uname -n
