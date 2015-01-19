set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



"utf-8
if has("multi_byte")
if &termencoding == ""
let &termencoding = &encoding
endif
set encoding=utf-8
setglobal fileencoding=utf-8
"setglobal bomb
set fileencodings=ucs-bom,utf-8,latin1
endif


"INICIO
set number
syntax on
colorscheme evening

"FUENTE
set guifont=Liberation\ Mono:h10  "Fuente

"VIMFILES
set noswapfile                    "Sin archivos de paginacion temps
set nobackup                      "Sin archivos de respaldo

"INDENTACION
set expandtab                     
set smarttab
set smartindent
set autoindent
set softtabstop=4 
set tabstop=4 
set shiftwidth=4
set expandtab
set wrap!


"GVIM WINDOW SIZE
set columns=120
set lines=40

"SCROLLING
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"OTHER
set ruler       "
set title       "Titulo en la ventana
set visualbell  "No sound

"MAP
map <F5> :NERDTreeToggle<CR>
map <F6> :setfiletype Ruby<CR>
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

"GUI
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

