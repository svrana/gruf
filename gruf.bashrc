#!/usr/bin/bash

#
# Source this from your .bashrc
#
# source $GRUF_CONFIG/gruf.bashrc
#


export GRUF_CONFIG=${HOME}/config
export GRUF_TMP=${GRUF_CONFIG}/tmp

if [ ! -d ${HOME}/.tmp ]; then
    mkdir ${HOME}/.tmp
fi

source $GRUF_CONFIG/grufproj.env

#
# source current project (from grufproj.env)
#
chp

alias cdp='cd $PROJECT'
alias tlc='(make-list && make-tags && make-cscope) &'
