" vim-godebug.vim - Go debugging for Vim
" Maintainer:    Brian Boughton <https://github.com/bboughton>
" Version:       0.1

if exists("b:godebug_loaded")
  finish
endif
let b:godebug_loaded = 1

" Set a global list of breakpoints, if not already exist
if !exists("g:godebug_breakpoints")
  let g:godebug_breakpoints = []
endif

let g:godebug_breakpoints_file = tempname()

" Private functions {{{1
function! godebug#toggleBreakpoint(file, line, ...) abort
  " Compose the breakpoint for delve:
  " Example: break /home/user/path/to/go/file.go:23
  let breakpoint = "break " . a:file. ':' . a:line

  " Define the sign for the gutter
  exe "sign define gobreakpoint text=◉ texthl=Search"

  " If the line isn't already in the list, add it.
  " Otherwise remove it from the list.
  let i = index(g:godebug_breakpoints, breakpoint)
  if i == -1
    call add(g:godebug_breakpoints, breakpoint)
    exe "sign place ". a:line ." line=" . a:line . " name=gobreakpoint file=" . a:file
  else
    call remove(g:godebug_breakpoints, i)
    exe "sign unplace ". a:line ." file=" . a:file
  endif
endfunction

function! godebug#writeBreakpointsFile(...) abort
  call writefile(g:godebug_breakpoints + ["continue"], g:godebug_breakpoints_file)
endfunction

function! godebug#debug(bang, ...) abort
  call godebug#writeBreakpointsFile()
  exe "!dlv debug --init=" . g:godebug_breakpoints_file
endfunction
