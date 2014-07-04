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

"migemo
nnoremap m/ g/

"NeoBundle stuff
if has('vim_starting')
  set nocompatible
  filetype off
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'YankRing.vim'

NeoBundle 'othree/eregex.vim'
let g:eregex_default_enable = 0

NeoBundle 'http://github.com/tpope/vim-surround.git'
NeoBundle 'http://github.com/tpope/vim-repeat.git'

"unite.vim
NeoBundle 'http://github.com/Shougo/unite.vim.git'
NeoBundle 'http://github.com/Shougo/neomru.vim.git'
let g:unite_enable_start_insert = 1
nnoremap <silent> <Space>uru :<C-u>Unite -buffer-name=mru file_mru directory_mru<CR>
nnoremap <silent> <Space>ubd :<C-u>UniteWithBufferDir -buffer-name=file file<CR>
nnoremap <silent> <Space>ue. :<C-u>UniteWithCurrentDir -buffer-name=file file<CR>

"neocomplecache
"neosnippet"
NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 30
let g:neosnippet#snippets_directory = "~/.vim/snippets"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-e> neocomplete#cancel_popup()

"vinarise
NeoBundle 'Shougo/vinarise.git'
let g:vinarise_objdump_command='gobjdump'

"quickrun
NeoBundle 'http://github.com/thinca/vim-quickrun.git'
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
NeoBundle 'http://github.com/mattn/emmet-vim.git'
let g:user_zen_leader_key = '<C-z>'
let g:user_zen_settings = {
\  'indentation' : '    '
\}

"speeddating
NeoBundle 'http://github.com/tpope/vim-speeddating.git'
nmap <silent> d; <Plug>SpeedDatingNowLocal

"tagbar
NeoBundle 'https://github.com/majutsushi/tagbar.git'
let g:tagbar_width = 30
let g:tagbar_sort = 0 "don't sort by name
nnoremap <silent> tl :TagbarToggle<CR>

"NERDTree"
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
let g:NERDTreeChDirMode = 0
let g:NERDTreeShowHidden = 1
nmap <silent> <Space>no :NERDTree %<CR>
nmap <silent> <Space>nt :NERDTreeToggle %<CR>

"sudo.vim
NeoBundle 'sudo.vim'

"coffee syntax
NeoBundle "kchmck/vim-coffee-script.git"
"chuck syntax
NeoBundle "vim-scripts/ck.vim"
"json syntax
NeoBundle "elzr/vim-json"
let g:vim_json_syntax_conceal = 0
"slim syntax
NeoBundle 'slim-template/vim-slim.git'

"solorized color scheme
NeoBundle "altercation/vim-colors-solarized.git"

"syntastic
NeoBundle "scrooloose/syntastic.git"

"cscope
NeoBundle "atakigawa/cscope_plus.vim"
let g:cscope_plus_leader_key = "<C-@>"

"golang
NeoBundle "jnwhiteh/vim-golang"

"golang settings
augroup Golang
  autocmd!
  "auto format go files on save
  autocmd BufWritePre *.go Fmt
  "adjust format options for go
  autocmd FileType go setlocal noexpandtab
  autocmd FileType go setlocal nolist
augroup END

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
  \ }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
