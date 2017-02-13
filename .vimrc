set nocompatible  " be iMproved, required
filetype off  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe' " Auto code completion
Plugin 'JamshedVesuna/vim-markdown-preview' " markdown preview (CTRL+p to preview)
Plugin 'lervag/vimtex' " latex plugin
Plugin 'scrooloose/nerdtree' " sidebar plugin
Plugin 'bronson/vim-trailing-whitespace' " hightlight  and remove trailing whitespace
"Plugin 'shime/livedown'
"Plugin 'mzlogin/vim-markdown-toc'
" All of your Plugins must be added before the following line
" :PluginList       - lists configured plugins
" see :h vundle for more details or wiki for FAQ
call vundle#end()
" Put your non-Plugin stuff after this line

colorscheme monokai  " awesome color scheme similar to sublime/textmate
syntax enable  " enable syntax processing
"filetype plugin indent on  " load filetype-specific indent files
filetype plugin on  " used this instead to ignore plugin indent changes
set ai   " automatic indent based on current line
set number   " show line numbers
set showcmd  " show command in bottom bar
set cursorline   " highlight current line
set wildmenu   " visual autocomplete for command menu
set showmatch  " highlight matching [{()}]
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
set tabstop=2  " number of visual spaces per TAB
set softtabstop=2  " number of spaces in tab when editing
set shiftwidth=2   " number of space characters inserted for indentation
set expandtab  " tabs are spaces
set pastetoggle=<F2>   " when in insert mode, press F2 to switch to paste mode
set linespace=2  " double linespacing for clarity esp. on large screens
set guifont=Monospace\ 14  " change default font type and size
set completeopt-=preview  " disable preview window
set backspace=indent,eol,start " allow backspacing past start of operation
set wrap " setup line wrapping
set linebreak
set colorcolumn=80
set nolist  " list disables linebreak
"set textwidth=0 "set textwidth=80
"set wrapmargin=0
"set formatoptions-=t

" add formatted status line
set statusline=%f  " Path to the file
set statusline+=\ \   " Separator
set statusline+=type:%y  " File Type
set statusline+=\ \   " Separator
set statusline+=format:[%{&ff}]
set statusline+=%=  " Switch to the right side
set statusline+=%v  " current column
set statusline+=,  " Separator
set statusline+=%l  " Current line
set statusline+=/  " Separator
set statusline+=%L  " Total lines
set laststatus=2  " always show status line

" alternate key combination <C-^> for caps locking
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfo

" latex configuration
let g:tex_flavor = "latex" " latex file type association
let g:vimtex_complete_recursive_bib=1
let g:vimtex_latexmk_continuous=0
let g:vimtex_latexmk_background=1

" spell checking
set spell
set spelllang=en
set spellfile=/media/muhaftab/bin/Dropbox/linux/vim/en.utf-8.add

" shortcuts
imap jj <Esc>  " use jj to escape insert mode
imap JJ <Esc>  " use JJ to escape insert mode
execute "set <M-l>=\el"
nmap mdv :LivedownPreview<CR> " markdown preview
let vim_markdown_preview_github=1
nmap \nn :NERDTreeToggle<CR> " toggle sidebar

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" change j,k to navigate screen line instead of file line
nnoremap j gj
nnoremap k gk
" also add reverse behavior in case you want to navigate file lines
nnoremap gj j
nnoremap gk k

" change $,^ to navigate screen line instead of file line
nnoremap $ g$
nnoremap ^ g^
nnoremap 0 g0

" also add reverse behavior in case you want to navigate file lines
nnoremap g$ $
nnoremap g^ ^
nnoremap g0 0

" change v$,v^ to visual copy follosing screen lines instead of file lines
nnoremap v$ vg$
nnoremap v^ vg^
nnoremap v0 vg0

" also add reverse behavior in case you want to navigate file lines
nnoremap vg$ v$
nnoremap vg^ v^
nnoremap vg0 v0

" remap these to <nop> so that they don’t do anything in normal mode
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
