set enc=utf-8
set fencs=iso-2022-jp,euc-jp,sjis,cp932,utf-8

"swap files dir
set directory=~/.vim/tmp
"backup files dir
set backupdir=~/.vim/tmp

"show line numbers
set number
"show ruler
set ruler
"highlight the other side of the parenthesis
set showmatch
"autoindent ON
set autoindent

"syntax highlight ON
syntax on

"undo-persistence
set undodir=~/.vim/tmp/.vimundo
set undofile

"show trailing white spaces
set list listchars=trail:*
highlight SpecialKey term=underline ctermbg=red guibg=red

set shiftwidth=2
set tabstop=2
set expandtab

set ignorecase
set smartcase
set incsearch
set hlsearch

set foldmethod=indent
set hidden
set backspace=2

nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap U <ESC>
nnoremap j gj
nnoremap k gk
"toggle among MacVim windows
nnoremap <silent> gw :macaction _cycleWindows:<CR>
nnoremap <silent> gW :macaction _cycleWindowsBackwards:<CR>

inoremap {<CR> {<CR>}<ESC>ko
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <C-@> <C-[>

augroup html
  autocmd!
  autocmd FileType html inoremap < <><left>
augroup END

vnoremap <C-@> <C-[>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-v> <C-r>*

autocmd BufEnter *.md set filetype=markdown

"migemo
nnoremap m/ g/

"Dein stuff start
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim')
if filereadable(expand('~/.vimrc.dein'))
  source ~/.vimrc.dein
endif

call dein#end()

let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$\|.sass-cache'
call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)

filetype plugin indent on

" install uninstalled plugins on startup.
if dein#check_install()
  call dein#install()
endif
"Dein stuff end
