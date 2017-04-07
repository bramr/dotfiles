"neomake syntax checking
autocmd BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_phpcs_args_standard="PSR1,PSR2"

"style warnings/errors
let g:neomake_warning_sign = {
  \ 'text': '⚠',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'ErrorMsg',
  \ }

"delimitmate expand on return
let delimitMate_expand_cr=1

" enable deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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
let g:pdv_template_dir = $HOME ."/.config/nvim/repos/github.com/tobyS/pdv/templates"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"Show/Hide NerdTree
nmap <silent> <Leader>7 :NERDTreeToggle<CR>

"Mappings for fzf
nnoremap <Leader>t :GFiles<CR>
nnoremap <Leader>T :Files<CR>
nnoremap <Leader>r :Buffers<CR>
nnoremap <Leader>R :Lines<CR>
nnoremap <Leader>y :Histoy/<CR>

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
