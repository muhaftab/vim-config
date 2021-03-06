" References
"   https://dougblack.io/words/a-good-vimrc.html
"   https://amix.dk/vim/vimrc.html

set nocompatible  " be iMproved, required
filetype off  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe' " Auto code completion
Plugin 'scrooloose/nerdtree' " sidebar plugin
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline' " status bar
Plugin 'vim-airline/vim-airline-themes' " status bar themes
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview' " markdown preview (CTRL+p to preview)
Plugin 'tpope/vim-surround' " quoting/parenthesizing made simple
Plugin 'tpope/vim-commentary' " smart commenting


"
"Plugin 'lervag/vimtex' " latex plugin
"Plugin 'bronson/vim-trailing-whitespace' " hightlight  and remove trailing whitespace
"Plugin 'vim-syntastic/syntastic'
"Plugin 'suxpert/vimcaps' " disable CAPSLOCK
"Plugin 'sudar/vim-arduino-syntax'
"Plugin 'plasticboy/vim-markdown' " markdown editing features
"Plugin 'mzlogin/vim-markdown-toc'
" All of your Plugins must be added before the following line
" :PluginList       - lists configured plugins
" see :h vundle for more details or wiki for FAQ
call vundle#end()
" Put your non-Plugin stuff after this line

syntax enable  " enable syntax processing
colorscheme monokai

filetype plugin indent on  " load filetype-specific indent files
"filetype plugin on  " used this instead to ignore plugin indent changes
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
set guifont=Monospace\ 13  " change default font type and size
set completeopt-=preview  " disable preview window
set backspace=indent,eol,start " allow backspacing past start of operation
set wrap " setup line wrapping
set linebreak
set colorcolumn=80
set nolist  " list disables linebreak
"set textwidth=0 "set textwidth=80
"set wrapmargin=0
"set formatoptions-=t

" alternate key combination <C-^> for caps locking
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfo
noremap  <Leader>' :let &l:imi = !&l:imi<CR>
inoremap <Leader>' <C-O>:let &l:imi = !&l:imi<CR>
cnoremap <Leader>' <C-^>
inoremap <Leader>' <C-^>

" completely disable caps lock
autocmd VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
autocmd VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" avoid using ESCAPE key because it's too far :)
imap jj <Esc> " use jj to escape insert mode
imap JJ <Esc> " use JJ to escape insert mode
cno jj <c-c> " use jj to escape command modes
cno JJ <c-c> " use jj to escape command modes

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap these to <nop> so that they don’t do anything in normal mode
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

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

" change v$,v^ to visual copy following screen lines instead of file lines
nnoremap v$ vg$
nnoremap v^ vg^
nnoremap v0 vg0

" also add reverse behavior in case you want to navigate file lines
nnoremap vg$ v$
nnoremap vg^ v^
nnoremap vg0 v0

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $ and ^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" search and replace word undder cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" find word under cursor
nnoremap <Leader>f /\<<C-r><C-w>\><CR>
" turn off highlighted search results
nnoremap <Leader>h :nohlsearch<CR>
" remove whitespaces at the end of lines
nnoremap <Leader>w :%s/\s\+$//<CR>

" auto adjust height of quick fix window
au FileType qf exe 5 . "wincmd _"
"au FileType qf call AdjustWindowHeight(3, 5)
"function! AdjustWindowHeight(minheight, maxheight)
"  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
"endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" customize status line
let g:airline_theme='papercolor'

"nmap <Leader>nt :NERDTreeTabsToggle<CR> " toggle sidebar
nmap <Leader>nt :NERDTreeToggle<CR> " toggle sidebar
nmap <Leader>q :tabclose<CR>
" Start NERDTree
autocmd VimEnter * NERDTree
" Shift focus to the main window.
autocmd VimEnter * wincmd p
let g:NERDTreeWinSize = 20

"Youcompleteme fix
let g:ycm_echo_current_diagnostic = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_filetype_specific_completion_to_disable = {
"  \ 'cpp': 0
"  \ }
