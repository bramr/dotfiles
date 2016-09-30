"      __                    _                                  __  _
"   /\ \ \ ___   ___ __   __(_) _ __ ___     ___  ___   _ __   / _|(_)  __ _
"  /  \/ // _ \ / _ \\ \ / /| || '_ ` _ \   / __|/ _ \ | '_ \ | |_ | | / _` |
" / /\  /|  __/| (_) |\ V / | || | | | | | | (__| (_) || | | ||  _|| || (_| |
" \_\ \/  \___| \___/  \_/  |_||_| |_| |_|  \___|\___/ |_| |_||_|  |_| \__, |
"                                                                      |___/

if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

"Plugin manager
call dein#add('Shougo/dein.vim')

"General stuff
call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim')
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

"Coding stuff
call dein#add('Shougo/deoplete.nvim')
call dein#add('neomake/neomake')
call dein#add('Raimondi/delimitMate')
call dein#add('SirVer/ultisnips')
call dein#add('bramr/vim-snippets')

"git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('jreybert/vimagit')
call dein#add('mxw/vim-jsx')

"javascript
call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})

"php
call dein#add('StanAngeloff/php.vim', {'on_ft': 'php'})
call dein#add('shawncplus/phpcomplete.vim', {'on_ft': 'php'})
call dein#add('2072/PHP-Indenting-for-VIm', {'on_ft': 'php'})
call dein#add('arnaud-lb/vim-php-namespace', {'on_ft': 'php'})
call dein#add('tobyS/vmustache', {'on_ft': 'php'})
call dein#add('tobyS/pdv', {'on_ft': 'php'})
call dein#add('lepture/vim-jinja', {'on_ft':['twig', 'jinja']})

"go
call dein#add('fatih/vim-go', {'on_ft': 'go'})

"html&css
call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'twig']})
call dein#add('gko/vim-coloresque', {'on_ft': 'css'})

"minor
call dein#add('vim-scripts/nginx.vim')
call dein#add('honza/dockerfile.vim')
call dein#add('chikamichi/mediawiki.vim')
call dein#add('elzr/vim-json', {'on_ft': 'json'})
call dein#add('freitass/todo.txt-vim')
call dein#add('tpope/vim-surround')

if has('mac')
  call dein#add('rizzatti/dash.vim')
endif

"optional
"call dein#add('ryanoasis/vim-devicons')

"Pretty colors
call dein#add('bramr/molokai')

call dein#end()

syntax on

colorscheme molokai

filetype plugin indent on

set relativenumber number

"Allow backspace over lines
set backspace=2

"Don't annoy coworkers :)
set visualbell

"setup ruler
set laststatus=2
set ruler

"Turn wildmenu completion on
set wildmenu
set wildmode=list:longest,full

" Ignore rules for Vim and plug-ins
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignorecase

"Setup default whitespaces
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set listchars=tab:▸-,eol:^,trail:_

set noeol

"Set spell checking to english, but disable by default
set spell spelllang=en
set nospell

"Yank to OS clipboard when not running tmux
if $TMUX == ''
    set clipboard+=unnamed
endif
"default file encoding and newline format
set encoding=utf-8
set fileformat=unix

"use incremental search
set incsearch

" Remember last 500 commands
set history=500

" Scroll 3 lines ahead
set scrolloff=3

" Write to swap after each 30 keystroaks
set updatecount=30

"Show matches, jump 300ms
set showmatch

set splitbelow
set splitright

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Write file contents automatically when exitting buffer
set autowrite

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,css,java,php,javascript,python,ruby,jinja,twig,xml,yml,phtml,vim autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

au FileType make setl noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.ctp set ft=php

au BufRead,BufNewFile *.twig set ft=jinja

au FileType html setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au FileType css setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au FileType config setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType rust setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType ruby setl softtabstop=2 tabstop=2 expandtab
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab
au FileType javascript setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType javascript.jsx setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType json setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType go setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 noexpandtab
au FileType jinja setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType twig setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType yaml setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType vim setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab

"Set completion for some filetypes
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd CompleteDone * pclose


"
" Plugin settings
"

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

"syntastic syntax checking
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_php_phpcs_args="--standard=PSR1,PSR2"
let g:syntastic_php_checkers = ['php','phpcs']
let g:syntastic_javascript_checkers=['eslint']

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
  "Mapping for Dash
  nnoremap <Leader>? :Dash<CR>
endif

"TODO customize in my theme
highlight LineNr ctermfg=244

"
" Keybindings
"

"set <Leader> key
let mapleader = ","
let maplocalleader= ","

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[<Paste>

"Move up down with space
nmap <S-k> 10k
nmap <Space> 10j
nmap <S-j> 10j

"Shifting code in visual mode and stay in visual
vnoremap > >gv
vnoremap < <gv

"Make tab help with panes managment
nmap <Tab> <C-w>
nmap <Tab><Tab> <C-w> w
nmap <S-Tab> :split<CR>
nmap <Leader><Tab> :vsplit<CR>

"Set omni completion
inoremap <C-f> <C-x><C-O>
inoremap <C-d> <C-x><C-n>

" map CTRL-V to piece-wise copying of the line above the current one
imap <C-v> a<esc>kywgi<esc>Pla<bs>
" select all
map <C-a> ggVG

" map <Leader>f to display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" sudo write file
cmap w!! w !sudo tee > /dev/null %<CR>

"Quickly set a file to my preferred format
nmap <Leader>e :setl fileencoding=utf-8 fileformat=unix<CR>

"Docblocks
let g:pdv_template_dir = $HOME ."/.config/nvim/repos/github.com/tobyS/pdv/templates"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"Mappings for to diff two buffers
nnoremap <Leader>D :windo diffoff<CR>

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

" Toggle listing invisible chars
nmap <silent> <Leader>5 :set list!<CR>
" Toggle line numbers
nmap <silent> <Leader>6 :set number!<CR>
"Show/Hide NerdTree
nmap <silent> <Leader>7 :NERDTreeToggle<CR>
