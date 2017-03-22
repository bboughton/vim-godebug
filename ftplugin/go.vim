" vim-godebug.vim - Go debugging for Vim
" Maintainer:    Brian Boughton <https://github.com/bboughton>
" Version:       0.1

if exists("b:godebug_ftplugin_loaded")
	finish
endif
let b:godebug_ftplugin_loaded = 1


" commands
command! -nargs=0 -bang GoToggleBreakpoint call godebug#toggleBreakpoint(expand('%:p'), line('.'))
command! -nargs=0 -bang GoDebug call godebug#debug(<bang>0, 0)
