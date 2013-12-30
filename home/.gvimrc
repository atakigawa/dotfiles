"height, width
set lines=65 columns=180
"font
set guifont=Osaka-Mono:h15
"cmdline height
set cmdheight=1

"IME settings
set iminsert=0 imsearch=0
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR><ESC>

"color
colorscheme solarized

"dont show toolbar
set guioptions-=T
"use command line mode for simple choices
set guioptions+=c
