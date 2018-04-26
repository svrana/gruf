"
" vim configuration.
"
" After following the instructions in gruf.bashrc, surce this file from your
" .vimrc and include the $GRUF_PROJECT directory in your tags directory list.
"
" source $GRUF_CONFIG/gruf.vimrc
" set tags=tags,$GRUF_PROJECT/tags
"

function! GotoProject()
    cd $GRUF_PROJECT
endfun

"
" Press backslash, g f to change current directory to the $PROJECT
" directory.
"
map     \gp :call GotoProject()<CR>
map!    \gp <ESC>:call GotoProject()<CR>
