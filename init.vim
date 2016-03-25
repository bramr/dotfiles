" Install vim-plug from github if not available
let vim_plug_script = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_script)
  echo "Installing Vim-Plug"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

"Navigation
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"General coding
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'bramr/vim-snippets'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"php
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
Plug 'tobyS/vmustache', {'for': 'php'}
Plug 'tobyS/pdv', {'for': 'php'}
Plug 'lepture/vim-jinja'

"rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}

"go
Plug 'fatih/vim-go', {'for': 'go'}

"javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'pmsorhaindo/syntastic-local-eslint.vim', {'for': 'javascript'}

"ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

"swift
Plug 'keith/swift.vim'

"minor
Plug 'vim-scripts/nginx.vim'
Plug 'honza/dockerfile.vim'
Plug 'chikamichi/mediawiki.vim'

if has('mac')
  Plug 'freitass/todo.txt-vim'
  Plug 'rizzatti/dash.vim'
endif

"Colorschemes
Plug 'bramr/molokai'
Plug 'noahfrederick/vim-noctu'
Plug 'vim-scripts/proton'

call plug#end()

colorscheme molokai

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

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Write file contents automatically when exitting buffer
set autowrite

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,css,java,php,javascript,python,ruby,jinja,twig,xml,yml,phtml,vim autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


"Change the statusline, normally overwritten by airline.vim
if has("statusline")
  set statusline=%t\        "tail of the filename
  set statusline+=%{fugitive#statusline()}
  set statusline+=[%{strlen(&fenc)?&fenc:'none'},  "file encoding
  set statusline+=%{&ff}]\  "file format
  set statusline+=%h        "help file flag
  set statusline+=%m        "modified flag
  set statusline+=%r        "read only flag
  set statusline+=%y        "filetype
  set statusline+=%=        "left/right separator
  set statusline+=%c,       "cursor column
  set statusline+=%l/%L     "cursor line/total lines
  set statusline+=\ %P      "percent through file
end

"
" Filetype definitions
"

filetype plugin indent on

au FileType make setl noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.json set ft=javascript
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
" Basic Keyboard shortcuts
"
"set <Leader> key
let mapleader = ","
let maplocalleader= ","

"Move up down with space
nmap <Leader><Space> 10k
nmap <Space> 10j

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[<Paste>

"Shifting code in visual mode and stay in visual
vnoremap > >gv
vnoremap < <gv

"Make tab help with panes managment
nmap <Tab> <C-w>
nmap <Tab><Tab> <C-w> w
nmap <S-Tab> :split<CR>
nmap <Leader><Tab> :vsplit<CR>

set splitbelow
set splitright

"easy splitting and back to 1 window
map <C-p> :setl lines=60 columns=272<CR>

"Use Ctrl-F for omni completion
inoremap <C-f> <C-x><C-O>
"Use Ctrl-D for omni completion
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

" use make command
nmap <Leader>m :make<CR>

nmap <F8> :TagbarToggle<CR>

"map spellcheck stuff
nmap <Leader>1 [s
nmap <Leader>2 ]s
nmap <Leader>3 z=
nmap <Leader>4 ]sz=
nmap <Leader>8 :setlocal spell spelllang=nl<CR>:setlocal spell<CR>
nmap <Leader>9 :setlocal spell spelllang=en_us<CR>:setlocal spell<CR>
nmap <Leader>0 :setlocal spell spelllang=en_us<CR>:setlocal nospell<CR>
" Toggle listing invisible chars
nmap <silent> <Leader>5 :set list!<CR>
" Toggle line numbers
nmap <silent> <Leader>6 :set number!<CR>
"Show/Hide NerdTree
nmap <silent> <Leader>7 :NERDTreeToggle<CR>

"
" Bundle settings
"

"syntastic syntax checking
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_php_phpcs_args="--standard=PSR1,PSR2"
let g:syntastic_php_checkers = ['php','phpcs']
let g:syntastic_javascript_checkers=['eslint']
"delimitmate expand on return
let delimitMate_expand_cr=1

"Ailine config
let g:airline_theme='simple'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols = {}
let g:airline_symbols.linenr='␤'
let g:airline_symbols.branch='⎇'

"Snippets config
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

let g:UltiSnipsEditSplit="vertical"

"JSX in js files
let g:jsx_ext_required = 0

"Mapping for ctrlp
let g:ctrlp_working_path_mode=''
noremap <Leader>t :CtrlP<CR>
noremap <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>
noremap <Leader>r :CtrlPBuffer<CR>

"Docblocks
let g:pdv_template_dir = $HOME ."/.config/nvim/plugged/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"Mappings for to diff two buffers
nnoremap <Leader>D :windo diffoff<CR>

"Fugitive mappings
nnoremap <Leader>g :Git
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>

if has('mac')
  "Mapping for Dash
  nnoremap <Leader>? :Dash<CR>
endif

