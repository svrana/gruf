# Gruf

Keeps track of your current project in an environment variable with
persistance. This can come in handy when configuring other tools,
filesystem navigation, etc.

  * chp: Change Project. Sets GRUF_PROJECT to the current directory.  Project
is stored in $GRUF_PROJECT_FILE to persist reboots.

  * chpt: Change Project Temporarily. Sets GRUF_PROJECT without persistance.

  * tlc: create filelist, run ctags and cscope

## Installation

1. Source gruf.bashrc from your .bashrc
2. Source gruf.vimrc from your .vimrc
