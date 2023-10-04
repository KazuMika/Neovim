#!/bin/bash
#

DATE=`date +%Y.%m.%d_%H.%M.%S`
HERE=`pwd`

# command line arguments
which=${1:-run}
echo
THIS_START=`date +%Y.%m.%d_%H.%M.%S`
echo "[START: $which] [$THIS_START] ######################################################################"
echo ----------------------------------------------------------------------
echo "--- which : $which ---"
echo ----------------------------------------------------------------------

# multiple args? run it one by one
if [ $# -gt 1 ]; then
    script=$0
    for which in "$@"; do
        $script $which
    done
    exit
fi

echo "--- [START] $which ---"
if [ $which == lua ]; then
    mv ./init2.lua ./init.lua
    mv ./init.vim ./init2.vim
  else
    mv ./init.lua ./init2.lua
    mv ./init2.vim ./init.vim
fi



# ----------------------------------------------------------------------
THIS_END=`date +%Y.%m.%d_%H.%M.%S`
echo ----------------------------------------------------------------------
echo "[END  : $which] [$THIS_END] ######################################################################"
echo ----------------------------------------------------------------------
echo
