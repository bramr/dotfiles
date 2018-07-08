"
" Plugin settings
"

"delimitmate expand on return
let delimitMate_expand_cr=1

"Ailine config
let g:airline_theme='simple'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols = {}
let g:airline_symbols.linenr='␤'
let g:airline_symbols.branch='⎇'
let g:airline_powerline_fonts = 1

"Don't conceal quotes in json
let g:vim_json_syntax_conceal = 0

"Mapping for ctrlp
let g:ctrlp_working_path_mode=''
noremap <Leader>t :CtrlP<CR>
noremap <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>
noremap <Leader>r :CtrlPBuffer<CR>

"Fugitive mappings
nnoremap <Leader>g :Git
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>

"Ale
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_completion_enabled = 1
let g:ale_php_phpcs_standard = 'PSR1,PSR2'

"Show/Hide NerdTree
nmap <silent> <Leader>7 :NERDTreeToggle<CR>
"Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_syntax_conceal = 0

if has('mac')
  "Change notes directory
  let g:notes_directories = ['~/Documents/VimNotes']
  "Mapping for Dash
  nnoremap <Leader>? :Dash<CR>
endif

