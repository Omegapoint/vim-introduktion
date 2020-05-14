" Viktors vimrc file
" I tweak the config every now and then, but this is how it looked on
" Omegapoints competence day 2020-05-15.
"
" Save as ~/.vimrc
" Note the comment loading the CoC plugin settings at around line 25.
"
" Requires minpac plugin manager, see installation instructions at
" https://github.com/k-takata/minpac
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minpac plugin manager

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

" plugins handled by minpac
call minpac#add('tpope/vim-surround')   " quoting/parenthesizing made simple
call minpac#add('tpope/vim-repeat')     " enables . repeat in some plugins
call minpac#add('tpope/vim-commentary') " comment out stuff
call minpac#add('sgur/vim-editorconfig') " editor config plugin

" git wrapper used for vim lightline status bar
call minpac#add('tpope/vim-fugitive')

" CoC language plugin
" Load the default settings for the plugin. These are the settings described
" in https://github.com/neoclide/coc.nvim#example-vim-configuration and are
" loaded from a separate file mostly to not confuse the custom settings in
" this vimrc with the defaults for coc.
" source ~/.vim/coc.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" polyglot, multi (programming) languages plugin
call minpac#add('sheerun/vim-polyglot')

" disable the american "double spaces after ." when joining lines
set nojoinspaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE linting plugin
call minpac#add('w0rp/ale')             " asynchronous linting engine

" configure default fixers
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

" do not lint or fix certain files
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}

let g:ale_sign_column_always = 1   " always show the sign column
let g:ale_fix_on_save = 1          " automatic fix when saving
let g:ale_lint_on_text_changed = 0 " no linting when text changes
let g:ale_lint_on_enter = 0        " no linting on enter
let g:ale_lint_on_save = 1         " lint when saving the file

" mappings to traverse the list of warnings from ale
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign plugin, allowing for aligning of tables etc.

call minpac#add('junegunn/vim-easy-align')
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user interface
call minpac#add('tpope/vim-vinegar')      " enhances netrw
call minpac#add('itchyny/lightline.vim')  " better status bar

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

set noshowmode          " -- INSERT -- is not needed, lightline shows the mode

let mapleader = ','	" remap leader to ,

" please be quiet vim
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" make that backspace key work the way it should
set backspace=indent,eol,start

" always show signcolumns
set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colouring

call minpac#add('NLKNguyen/papercolor-theme')
"
" set color scheme
"colorscheme desert
set t_Co=256   " This is may or may not needed.
set background=light
colorscheme PaperColor

if !exists("g:syntax_on")
    syntax enable
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editing

" indentation and spaces
set expandtab		" expand tabs to spaces
set shiftwidth=2	" 2 spaces as default
set softtabstop=2
set ai                  " set auto-indenting on for programming

filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file management

" keeping edits safe with suggestions from
" https://begriffs.com/posts/2019-07-19-history-use-vim.html
" Protect changes between writes. Default values of updatecount (200
" keystrokes) and updatetime (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//
" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
  " consolidate the writebackups -- not a big deal either way, since they
  " usually get deleted
  set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

set showcmd             " display incomplete commands
set number              " show line numbers
set ruler               " show the current row and column

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" searching

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

" fzf fuzzy searching
call minpac#add('junegunn/fzf.vim')     " improved fzf plugin
nnoremap <C-p> :<C-u>FZF<CR>

" source fzf installed with apt (making this vimrc work both on Mac and
" Debian)
try
  source /usr/share/doc/fzf/examples/fzf.vim
catch
  " Ignore if the file can't be loaded
endtry

" source fzf installed on mac os
set rtp+=/usr/local/opt/fzf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git settings
" Use 72 texts line length for commit messages
" https://stackoverflow.com/questions/2290016/git-commit-messages-50-72-formatting
autocmd Filetype gitcommit setlocal spell textwidth=72

" Create a command Gshow that populates the quickfix window with changed files
" with changed files from git commit https://vi.stackexchange.com/a/13435
command -nargs=? -bar Gshow call setqflist(map(systemlist("git show --pretty='' --name-only <args>"), '{"filename": v:val, "lnum": 1}'))
