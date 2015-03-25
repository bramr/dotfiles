" Bram Rohde's vimrc
"

"vImproved
set nocompatible

filetype off
set modelines=0

" On Windows, also use: '.vim' instead of: 'vimfiles'
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$VIMHOME/.vim/after
endif

" Install vundle from github if it's not available
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    if has('win32') || has('win64')
        silent cd ~
        silent !mkdir .vim\bundle
        silent !git clone https://github.com/gmarik/vundle .vim/bundle/vundle
    else
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    endif
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'

"My Bundles
Bundle 'Shougo/vimproc.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'mattn/emmet-vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle "lepture/vim-jinja"
Bundle 'StanAngeloff/php.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'm2mdas/phpcomplete-extended'
Bundle 'joonty/vdebug'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
Bundle 'rizzatti/dash.vim'
Bundle 'fatih/vim-go'
"Bundle 'hhvm/vim-hack'
Bundle 'mxw/vim-jsx'

"Colorscheme bundles
Bundle 'bramr/molokai'
Bundle 'noahfrederick/vim-noctu'
Bundle 'vim-scripts/proton'

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

"Use light colorscheme for gui, but a good dark otherwise
if has("gui_running")
  set background=dark
  colorscheme molokai
else
  set t_Co=256
  set term=screen-256color
  set background=dark
  colorscheme molokai "noctu (for 16 color terms)
end

"Syntax hl on
syntax on

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

"Set spell checking to us english, but disable by default
set spell spelllang=en_us
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

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Write file contents automatically when exitting buffer
set autowrite

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,css,java,php,javascript,python,ruby,jinja,twig,xml,yml,phtml,vim autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd CompleteDone * pclose

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

"Put swap files in one directory
set directory^=$HOME/.vim/_swap//

"set up gui look for windows/mac
if has("win32") || has("win64")
  set guioptions=-M
  set guifont=Envy\ Code\ R:h10
  set columns=95
  set lines=34
  set directory^=$HOME/vimfiles/_swap//
end
if has("gui_macvim")
  set guifont=Inconsolata:h15
  set columns=95
  set lines=34
  " Swipe to move between bufers
  map <SwipeLeft> :bprev<CR>
  map <SwipeRight> :bnext<CR>
end

"Show matches, jump 300ms
set showmatch
set matchtime=3

"Avoid loading default MatchParen plugin
let loaded_matchparen=1

"
" Filetype definitions
"

filetype plugin indent on

au FileType make setl noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,THorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.ctp set ft=php

au BufRead,BufNewFile *.twig set ft=jinja

au FileType html setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType ruby setl softtabstop=2 tabstop=2 expandtab
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab
au FileType javascript setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType go setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 noexpandtab
au FileType jinja setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType twig setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType vim setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab

"
" Basic Keyboard shortcuts
"
"set <Leader> key
let mapleader = ","

"Move up down with space
nmap <S-Space> 10k
nmap <Space> 10j

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
let g:syntastic_phpcs_disable=1
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

"Composer location
let g:phpcomplete_index_composer_command="php /usr/local/bin/composer.phar"
nnoremap <Leader>pc :PHPCompleteExtendedClearIndexCache<CR>

"Fugitive mappings
nnoremap <Leader>g :Git
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>

"Mapping for Dash
nnoremap <Leader>/ :Dash
nnoremap <Leader>? :Dash<CR>
