"
" Plugin settings
"

"syntastic syntax checking
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_php_phpcs_args="--standard=PSR1,PSR2"
let g:syntastic_php_checkers = ['php','phpcs']
let g:syntastic_javascript_checkers=['eslint']

"delimitmate expand on return
let delimitMate_expand_cr=1

"Hide scratch buffer after insert
let g:ycm_autoclose_preview_window_after_insertion=1

"Ailine config
let g:airline_theme='simple'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols = {}
let g:airline_symbols.linenr='␤'
let g:airline_symbols.branch='⎇'
let g:airline_powerline_fonts = 1

"Snippets config
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"

"JSX in js files
let g:jsx_ext_required = 0

"Don't conceal quotes in json
let g:vim_json_syntax_conceal = 0


if has('mac')
  "Change notes directory
  let g:notes_directories = ['~/Documents/VimNotes']
  "Mapping for Dash
  nnoremap <Leader>? :Dash<CR>
endif

"Docblocks
let g:pdv_template_dir = "/Users/bram/.config/nvim/plugged/pdv/templates"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>


"Mappings for fzf
nnoremap <Leader>t :GFiles<CR>
nnoremap <Leader>T :Files<CR>
nnoremap <Leader>r :Buffers<CR>
nnoremap <Leader>R :Lines<CR>
nnoremap <Leader>y :History<CR>

"Mappings for errors/neomake
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>E :lclose<CR>
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>N :lprev<CR>

"Fugitive mappings
nnoremap <Leader>g :Git
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>

"Show/Hide NerdTree
nmap <silent> <Leader>7 :NERDTreeToggle<CR>
