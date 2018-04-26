#!/bin/bash

# Source this file from your .bashrc or .zshrc
#
# source ~/gruf/gruf.bashrc
#

# Set GRUF_CONFIG to the location of this file
export GRUF_CONFIG="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# GRUF_PROJECT_PATH operates like the CDPATH environment variable- a list of colon
# seperated pathnames that will be searched for the specified project.
export GRUF_PROJECT_PATH=$HOME/Projects:$HOME/workspace
# temporary directory for project persistance
export GRUF_TMP=$GRUF_CONFIG/tmp
# tempory file used for let g:autotagTagsFile=".tags"project persistence
export GRUF_PROJECT_FILE=$GRUF_TMP/project.gruf

source "$GRUF_CONFIG/grufproj.env"

#
# source current project (from grufproj.env)
#
chp

alias pclean='rm -f $GRUF_PROJECT/.gruf.filelist $GRUF_PROJECT/tags $GRUF_PROJECT/cscope.out $GRUF_PROJECT/ncscope.out'

#
# Create cscope database based on .gruf.filelist
#
function make_cscope() {
    cscope -b -i.gruf.filelist > /dev/null 2>&1
}

#
# Find all files in the directory, if it doesn't match one of the patterns and
# it's a text file, add its name to the .gruf.filelist file.
#
# ignore uninteresting directorie-a "s
function make_list() {
    fd -t f "$GRUF_FD_OPTIONS" > .gruf.filelist
    if [ -n "$VIRTUAL_ENV" ]; then
        fd -t f '.py$' "$VIRTUAL_ENV" >> .gruf.filelist
    fi
}

function make_tags() {
    ctags -L .gruf.filelist > /dev/null 2>&1
}

alias tlc='(make_list && make_tags && make_cscope) &'
