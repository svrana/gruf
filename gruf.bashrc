#!/usr/bin/bash

#
# Source this file from your .bashrc
#
# source ~/gruf/gruf.bashrc
#

# Set GRUF_CONFIG to the location of this file
export GRUF_CONFIG="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# PROJPATH operates like the CDPATH environment variable- a list of colon
# seperated pathnames that will be searched for the specified project.
export GRUF_PROJPATH=${HOME}/Projects:${HOME}/workspace

# temporary directory for project persistance
export GRUF_TMP=${GRUF_CONFIG}/tmp

if [ ! -d ${GRUF_TMP} ]; then
    mkdir ${GRUF_TMP}
fi

source $GRUF_CONFIG/grufproj.env

#
# source current project (from grufproj.env)
#
chp

alias cdp='cd $GRUF_PROJECT'
alias tlc='($GRUF_CONFIG/make-list && $GRUF_CONFIG/make-tags && $GRUF_CONFIG/make-cscope) &'
alias pclean='rm -f $GRUF_PROJECT/.gruf.filelist $GRUF_PROJECT/tags $GRUF_PROJECT/cscope.out $GRUF_PROJECT/ncscope.out'

function pvi()
{
    gruf_editor_find $EDITOR $1 $GRUF_PROJECT
}

function plvi()
{
    gruf_editor_filelist_find $EDITOR $1 $GRUF_PROJECT .filelist
}

#
#    gruf_editor_filelist_find(char *editor, char *fileparam, char *dir)
#
# @param editor      the editor in which to load file
# @param fileparam   filename
# @param dir         directory that contains filelist to search
#                    and which will serve as the base directory
#                    from which to load the file contained in
#                    filelist
# @param filelist    name of filelist
#
function gruf_editor_filelist_find()
{
    local editor=$1;
    local fileparam=$2;
    local dir=$3;
    local filelist=$4;

    if [ -z $editor ]; then
        echo "requires editor"
        return 1
    elif [ -z $fileparam ]; then
        echo "requires filename"
        return 1
    elif [ -z $dir ]; then
        echo "requires starting directory"
        return 1
    elif [ -z $filelist ]; then
        echo "requires filelist"
        return 1
    elif [ ! -f $dir/$filelist ]; then
        echo "$dir/$filelist does not exist"
        return 1;
    fi

    # change directory where file is located
    cd $dir
    #echo "running command '${cmd}'"

    local filename=$(grep $fileparam $filelist | head -n1)

    if [ -z "$filename" ]; then
        echo "filename not found"
        return 1
    fi

    $editor $filename

    return 0
}

#
#       gruf_editor_find(char *editor, char *fileparam, char *dir)
#
# @param editor 	the editor in which to load file specified by
#               	fileparam
# @param fileparam 	filename or beginning of filename for which to s
# @param dir 		directory in which search begins
#
# If this is to slow for you, use a filelist.
#
function gruf_editor_find()
{
    local editor=$1;
    local fileparam=$2;
    local dir=$3;

    if [ -z $editor ]; then
	echo "requires editor"
	return 1
    elif [ -z $fileparam ]; then
	echo "requires filename"
	return 1
    elif [ -z $dir ]; then
	echo "requires starting directory"
	return 1
    fi

    # change directory where file is located
    cd $dir
    local name_param="-name"

    # check if fileparam has slashes in it.  If it does, then change 
    # the name parameter to find accordingly.
    if [[ ${fileparam/\//} != "${fileparam}" ]]; then
	name_param="-samefile"
    fi

    local expr1="find -mount -type f ${name_param}"
    local expr2="-print0 -quit"
    local cmd="$expr1 ${fileparam} $expr2"
    #echo "running command '$cmd'"

    # turn off filename expansion so that find is passed the asterick
    set -f
    local filename=$($cmd)

    if [ -z $filename ]; then
	cmd="$expr1 ${fileparam}* $expr2"
	#echo "Could not find ${fileparam}-- trying ${cmd}"

	filename=$($cmd)
	if [ -z $filename ]; then
	    cmd="$expr1 *${fileparam}* $expr2"
	    #echo "Could not find ${fileparam}*-- trying ${cmd}"
	    filename=$($cmd)
	fi
    fi
    set +f

    if [ -z $filename ]; then
	echo "filename not found"
	return 1
    fi

    $editor $filename

    return 0
}

