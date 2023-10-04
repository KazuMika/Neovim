#!/bin/bash
#
# Basic if statement
which=$1
echo $which

if [ "$which" == "lua" ]; then
    mv init2.lua init.lua
    mv init.vim init2.vim
else
    mv init.lua init2.lua
    mv init2.vim init.vim
fi
