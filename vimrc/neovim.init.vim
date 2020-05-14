" This neovim init script sources the normal .vimrc file, making it easy to
" have the same settings for both vim and neovim
"
" Save this file to ~/.config/nvim/init.vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" set paths for python, allowing nvim to use a custom virtualenv rather than
" the system default. The paths below assumes you manage your python versions
" with pyenv (with pyenv-virtualenv) plugin and have created the virtual
" environments neovim2 and neovim3
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python3'
let g:python_host_prog = '~/.pyenv/versions/neovim2/bin/python2'
