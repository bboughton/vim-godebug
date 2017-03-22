vim-godebug
===========

Go debugging for Vim.

See it in action
----------------

![vim-godebug]

Prerequisites
-------------

-   Go
-   Vim
-   [vim-go]
-   [Delve]
-   On macOS, it is advised to install through [brew], due to problems
    with certificates.

Installation
------------

Copy all files to your ~/.vim directory or use Tim Pope's excellent
pathogen plugin (<http://github.com/tpope/vim-pathogen>).

Usage
-----

`:call GoToggleBreakpoint()` to add or remove a breakpoint at the
current line `:call GoDebug()` to start a debug session for the main
package

Mappings
--------

    au FileType go nmap <buffer> <leader>bp <Plug>(godebug-toggle-breakpoint)

Copyright
---------

2017 - Luca Guidi - <https://lucaguidi.com>

  [vim-godebug]: https://github.com/jodosha/vim-go-debug/raw/master/vim-godebug.gif
  [vim-go]: https://github.com/fatih/vim-go
  [Delve]: https://github.com/derekparker/delve
  [brew]: https://github.com/derekparker/delve/blob/master/Documentation/installation/osx/install.md#via-homebrew
