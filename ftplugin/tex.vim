" latex configuration
let g:tex_flavor = "latex" " latex file type association
let g:vimtex_complete_recursive_bib=1
let g:vimtex_compiler_latexmk = {
\ 'background' : 1,
\ 'build_dir' : 'build',
\ 'callback' : 0,
\ 'continuous' : 0,
\}

" spell checking
set spell
set spelllang=en_us spell
set spellfile=~/.vim/dict/en.utf-8.add
"
"" change j,k to navigate screen line instead of file line
"nnoremap j gj
"nnoremap k gk
"" also add reverse behavior in case you want to navigate file lines
"nnoremap gj j
"nnoremap gk k
"
"" change $,^ to navigate screen line instead of file line
"nnoremap $ g$
"nnoremap ^ g^
"nnoremap 0 g0
"
"" also add reverse behavior in case you want to navigate file lines
"nnoremap g$ $
"nnoremap g^ ^
"nnoremap g0 0
"
"" change v$,v^ to visual copy following screen lines instead of file lines
"nnoremap v$ vg$
"nnoremap v^ vg^
"nnoremap v0 vg0
"
"" also add reverse behavior in case you want to navigate file lines
"nnoremap vg$ v$
"nnoremap vg^ v^
"nnoremap vg0 v0
