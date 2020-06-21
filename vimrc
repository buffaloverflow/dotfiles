autocmd!
autocmd!

" Look and feel
set ts=4 sts=4 sw=4
syntax on
set hlsearch nu expandtab smarttab noerrorbells showcmd
colorscheme darkblue
hi Normal ctermbg=none
set colorcolumn=121
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" Folding
set bs=2 foldmethod=indent fdn=5
nnoremap <space> za
nnoremap <C-UP> zk
nnoremap <C-DOWN> zj
set foldenable

" Remember me!!!
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Py Stuff
autocmd FileType python set smartindent cinwords=if,elif,else,for.while,try,except,finally,def,class,with
autocmd FileType python nmap <buffer> <f5> :w<Esc>mwG:!python %<CR>
" autocmd FileType python nmap <buffer> <f4> :w<Esc>mwG:!$GHIDRA_DIR/support/analyzeHeadless ~/.ghidra/repositories/ $GHIDRA_REPO -noanalysis -process $GHIDRA_TARGET -readOnly -scriptPath $(pwd) -postScript %<CR>

" C Stuff
autocmd FileType c,cpp nmap <buffer> <f5> :w<Esc>:!pushd $BUILD_DIR && make -j $CORES <CR>
autocmd FileType c,cpp nmap <buffer> <f4> :w<Esc>:!make -j $CORES <CR>

" Tags are cool
set tags=./.tags;
nnoremap <f12> <Esc>:!ctags -R -f .tags .<CR>
nnoremap gf <Esc><C-w>gF
nnoremap <C-]> g<C-]>

" Comment/Recomment
let b:comment='#'
autocmd FileType vim,vimrc let b:comment = '" '
autocmd FileType c,cpp,java let b:comment = '\/\/'

nmap <expr> - AddComment()
vmap <expr> - AddComment()
nmap <expr> _ DelComment()
vmap <expr> _ DelComment()

function! AddComment()
	return ':s/^\(\s*\)/\1' . b:comment . '/' . "\r:nohl\r"
endfunction

function! DelComment()
	return ':s/^\(\s*\)' . b:comment . '/\1' . "\r:nohl\r"
endfunction
