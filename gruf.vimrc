"
" vim configuration.
"
" Source this from your .vimrc
"
" Add 'source $GRUF_CONFIG/gruf-vim.rc' to your .vimrc
"
"

function! GotoProject()
    cd $PROJECT
endfun

"
" Press backslash, g f to change current directory to the $PROJECT
" directory.
"
map     \gp :call GotoProject()<CR>
map!    \gp <ESC>:call GotoProject()<CR>

"
" In any mode, press backslash followed by g and f for a 'File:' prompt
" that will use the project file to lookup the file's location in the 
" directory tree and load the file in the editor.
"
map     \gf :call GetFileFromFileList(getcwd(), '.filelist')<CR>
map!    \gf <ESC>:call GetFileFromFileList(getcwd(), '.filelist')<CR>



"
" Prompt for a filename, attempt to find its full path by searching a
" filelist.  The name of the filelist and its location are specified
" as arguments to this function.
"
function! GetFileFromFileList(startdir, filelist)
    let myfilelist=a:startdir . '/' . a:filelist
    if !filereadable(myfilelist)
        echoerr "File list does not exist: " . myfilelist
    else
        let myfile=input("Filename? ")
        if strlen(myfile) != 0
            let cmd = 'grep -E "\<"' . myfile . ' ' . a:startdir . '/' . a:filel
            let path = system(cmd)
            if strlen(path) == 0
                " first instance gives line number of this message for some
                " annoying reason
                echoerr 'File not found'
            else
                exec 'edit' path
            endif
        endif
    endif
endfun


