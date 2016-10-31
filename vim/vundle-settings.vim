"
" Plugin settings
"

"syntastic syntax checking
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_php_phpcs_args="--standard=PSR1,PSR2"
let g:syntastic_php_checkers = ['php','phpcs']
let g:syntastic_javascript_checkers=['jsxhint']

"delimitmate expand on return
let delimitMate_expand_cr=1

"Ailine config
let g:airline_theme='simple'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols = {}
let g:airline_symbols.linenr='␤'
let g:airline_symbols.branch='⎇'

"Mapping for ctrlp
let g:ctrlp_working_path_mode=''
noremap <Leader>t :CtrlP<CR>
noremap <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>
noremap <Leader>r :CtrlPBuffer<CR>

"Mappings for to diff two buffers
nnoremap <Leader>d :NERDTreeClose<CR>:windo diffthis<CR>
nnoremap <Leader>D :windo diffoff<CR>

"Fugitive mappings
nnoremap <Leader>g :Git
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>

"Show/Hide NerdTree
nmap <silent> <Leader>7 :NERDTreeToggle<CR>
