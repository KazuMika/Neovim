#!/bin/bash
#

DATE=`date +%Y.%m.%d_%H.%M.%S`
HERE=`pwd`

# huggingface
# https://huggingface.co/runwayml/stable-diffusion-inpainting
# https://huggingface.co/stabilityai/stable-diffusion-2-inpainting
# github 
# https://github.com/huggingface/diffusers/tree/main/examples/research_projects/dreambooth_inpaint
# https://github.com/ShivamShrirao/diffusers/tree/main/examples/dreambooth
#
# ref
# https://www.sicara.fr/blog-technique/dataset-generation-fine-tune-stable-diffusion-inpainting


# usage: go [paper | code | setup | conda | data | train | eval | export | run |  rsync | etc...]

# ----------------------------------------------------------------------
# XXX: CHANGE ME
# ----------------------------------------------------------------------
USE_PYTHON_VERSION=3.8
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------

# command line arguments
which=${1:-run}
echo
THIS_START=`date +%Y.%m.%d_%H.%M.%S`
echo "[START: $which] [$THIS_START] ######################################################################"
echo ----------------------------------------------------------------------
echo "--- which : $which ---"
echo ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# multiple args? run it one by one
if [ $# -gt 1 ]; then
    script=$0
    for which in "$@"; do
        $script $which
    done
    exit
fi

# ----------------------------------------------------------------------
# split

echo "--- [START] $which ---"
if [ $which == lua ]; then
    mv ./init2.lua ./init.lua
    mv ./init.vim ./init2.vim
  else
    mv ./init.lua ./init2.lua
    mv ./init2.vim ./init.vim
fi
echo "--- [END  ] $which ---"



# ----------------------------------------------------------------------
THIS_END=`date +%Y.%m.%d_%H.%M.%S`
echo ----------------------------------------------------------------------
echo "[END  : $which] [$THIS_END] ######################################################################"
echo ----------------------------------------------------------------------
echo
