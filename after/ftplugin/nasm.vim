" $VIMRUNTIME ships syntax/nasm.vim but no ftplugin/nasm.vim, so
" 'commentstring' is empty and the built-in gc/gcc commenting has nothing
" to work with.
setlocal commentstring=;\ %s
