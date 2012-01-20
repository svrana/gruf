#!/usr/bin/bash

#
# Source this from your .bashrc
#
# source gruf.bashrc
#

# where these files are stored
export GRUF_CONFIG=${HOME}/gruf

# PROJPATH operates like the CDPATH environment variable- a list of colon
# seperated pathnames that will be searched for the specified project.
export GRUF_PROJPATH=${HOME}/Projects

# temporary directory for project persistance
export GRUF_TMP=${GRUF_CONFIG}/tmp

if [ ! -d ${HOME}/.tmp ]; then
    mkdir ${HOME}/.tmp
fi

source $GRUF_CONFIG/grufproj.env

#
# source current project (from grufproj.env)
#
chp

alias cdp='cd $GRUF_PROJECT'
alias tlc='(make-list && make-tags && make-cscope) &'
