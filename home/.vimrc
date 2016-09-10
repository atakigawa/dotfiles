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

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'

"unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim'
let g:unite_enable_start_insert = 1
nnoremap <silent> <Space>uf :<C-u>Unite -buffer-name=files file_rec/async:!<CR>
nnoremap <silent> <Space>uF :<C-u>UniteWithBufferDir -buffer-name=files file_rec/async:!<CR>
nnoremap <silent> <Space>ur :<C-u>Unite -buffer-name=mru file_mru<CR>
nnoremap <silent> <Space>ub :<C-u>Unite -buffer-name=buffer buffer<CR>

"neocomplecache
"neosnippet"
NeoBundle 'Shougo/neocomplete'
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
NeoBundle 'Shougo/vinarise'
let g:vinarise_objdump_command='gobjdump'

"quickrun
NeoBundle 'thinca/vim-quickrun'
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
NeoBundle 'mattn/emmet-vim'
let g:user_zen_leader_key = '<C-z>'
let g:user_zen_settings = {
\  'indentation' : '    '
\}

"speeddating
NeoBundle 'tpope/vim-speeddating'
nmap <silent> d; <Plug>SpeedDatingNowLocal

"tagbar
NeoBundle 'majutsushi/tagbar'
let g:tagbar_width = 30
let g:tagbar_sort = 0 "don't sort by name
nnoremap <silent> tl :TagbarToggle<CR>

"NERDTree"
NeoBundle 'scrooloose/nerdtree'
let g:NERDTreeChDirMode = 0
let g:NERDTreeShowHidden = 1
nmap <silent> <Space>no :NERDTree %:p:h<CR>
nmap <silent> <Space>nt :NERDTreeToggle %:p:h<CR>

"sudo.vim
NeoBundle 'sudo.vim'

"coffee syntax
NeoBundle "kchmck/vim-coffee-script"
"chuck syntax
NeoBundle "vim-scripts/ck.vim"
"json syntax
NeoBundle "elzr/vim-json"
let g:vim_json_syntax_conceal = 0
"slim syntax
NeoBundle 'slim-template/vim-slim'
"js syntax (es6)
NeoBundle 'othree/yajs.vim'

"solorized color scheme
NeoBundle "altercation/vim-colors-solarized"

"cscope
NeoBundle "atakigawa/cscope_plus.vim"
let g:cscope_plus_leader_key = "<C-@>"

"golang
NeoBundle "fatih/vim-go"
let g:go_fmt_command = "goimports"

set rtp+=/Users/kenken/go/src/github.com/golang/lint/misc/vim

"golang settings
augroup Golang
  autocmd!
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

"ace
NeoBundle "yosssi/vim-ace"

"elixir
NeoBundle 'elixir-lang/vim-elixir'

"syntastic
NeoBundle "scrooloose/syntastic"
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_python_checkers = ['pep8', 'pyflakes']
let g:syntastic_python_pep8_args = '--ignore=E127,E128,E231,E226,E402'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_css_checkers = ['prettycss']
let g:syntastic_css_prettycss_args = '-i suggest-relative-unit:px -i browser-only:ie'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" has to be called after neobundle#end()
let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$\|.sass-cache'
call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)
