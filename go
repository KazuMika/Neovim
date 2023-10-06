#!/bin/bash
#
# Basic if statement
which=$1
echo $which

if [ "$which" == "lua" ]; then
    mv init2.lua init.lua
    mv init.vim init2.vim
elif [ "$which" == "vim" ]; then
    mv init.lua init2.lua
    mv init2.vim init.vim
fi

if [ $which == git ]; then
    echo "--- [START] $which ---"
    comment=""
    git add . 
    git commit -m "`date +%Y.%m.%d` $comment"
    git push

    echo "--- [END  ] $which ---"
fi

