" Awesome Vim config file by Jeremy McNevin
" Pieced together from various sources.

set nocompatible

" Enable syntax highlighting.
syntax on

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set ai
set si
set wrap!

map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=4<cr>

" Set color scheme that I like.
if has("gui_running")
  colorscheme desert
else
  colorscheme darkblue
endif

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

set nocp

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

set showmatch
set mat=2

map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc

set encoding=utf8
try
  lang en_US
catch
endtry

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.rb,*.haml,*.rake :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

try
  set autochdir
catch
endtry

set backspace=indent,eol,start
set cursorline
set matchtime=5
set number
set numberwidth=5
set scrolloff=10
set sidescrolloff=10
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

nnoremap <silent> <Leader>l
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>

