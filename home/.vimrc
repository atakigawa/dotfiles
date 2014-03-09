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

set shiftwidth=4
set tabstop=4
set expandtab

set ignorecase
set smartcase
set incsearch
set hlsearch

set foldmethod=indent
set clipboard+=unnamed
set hidden

nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap U <ESC>
nnoremap j gj
nnoremap k gk
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
"toggle among MacVim windows
nnoremap <silent> gw :macaction _cycleWindows:<CR>
nnoremap <silent> gW :macaction _cycleWindowsBackwards:<CR>

inoremap {<CR> {<CR>}<ESC>ko
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <C-@> <C-[>
autocmd FileType html inoremap < <><left>

vnoremap <C-@> <C-[>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-v> <C-r>*

"Java
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

"Python
autocmd FileType python set omnifunc=pythoncomplete#Complete

"migemo
nnoremap m/ g/

"settings for tabs
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]
    let no = i
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '

    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

nnoremap [Tag] <Nop>
nmap t [Tag]
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

filetype off
"Plugins managed by vundle" {{{
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'YankRing.vim'

Bundle 'othree/eregex.vim'
let g:eregex_default_enable = 0

Bundle 'http://github.com/tpope/vim-surround.git'
Bundle 'http://github.com/tpope/vim-repeat.git'
Bundle 'http://github.com/thinca/vim-ref.git'

"unite.vim
Bundle 'http://github.com/Shougo/unite.vim.git'
Bundle 'http://github.com/Shougo/neomru.vim.git'
let g:unite_enable_start_insert = 1
nnoremap <silent> <Space>uru :<C-u>Unite -buffer-name=mru file_mru directory_mru<CR>
nnoremap <silent> <Space>ubd :<C-u>UniteWithBufferDir -buffer-name=file file<CR>
nnoremap <silent> <Space>ue. :<C-u>UniteWithCurrentDir -buffer-name=file file<CR>

"neocomplecache
"neosnippet"
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_max_list = 30
let g:neosnippet#snippets_directory = "~/.vim/snippets"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-e> neocomplcache#cancel_popup()

"vinarise
Bundle 'Shougo/vinarise.git'
let g:vinarise_objdump_command='gobjdump'

"quickrun
Bundle 'http://github.com/thinca/vim-quickrun.git'
nnoremap <Space>qr :QuickRun<CR>
let g:quickrun_config = {
\  '*': {
\    'split': 'botright'
\  },
\  'clojure': {
\    'command': 'clj',
\    'exec': '%c %s',
\    'tempfile': '{tempname()}.clj',
\  }
\}

"zencoding
Bundle 'http://github.com/mattn/zencoding-vim.git'
let g:user_zen_leader_key = '<C-z>'
let g:user_zen_settings = {
\  'indentation' : '    '
\}

"speeddating
Bundle 'http://github.com/tpope/vim-speeddating.git'
nmap <silent> d; <Plug>SpeedDatingNowLocal

"tagbar
Bundle 'https://github.com/majutsushi/tagbar.git'
let g:tagbar_width = 30
let g:tagbar_sort = 0 "don't sort by name
nnoremap <silent> tl :TagbarToggle<CR>

"NERDTree"
Bundle 'https://github.com/scrooloose/nerdtree.git'
let g:NERDTreeChDirMode = 1
let g:NERDTreeShowHidden = 1
nmap <silent> no :cd %:p:h<CR>:NERDTree<CR>
nmap <silent> nt :cd %:p:h<CR>:NERDTreeToggle<CR>

"sudo.vim
Bundle 'sudo.vim'

"coffee syntax
Bundle "kchmck/vim-coffee-script.git"

"chuck syntax
Bundle "vim-scripts/ck.vim"

"solorized color scheme
Bundle "altercation/vim-colors-solarized.git"

"syntastic
Bundle "scrooloose/syntastic.git"

"enable filetype detection, ftplugin, and indent
filetype plugin indent on

" " }}}
