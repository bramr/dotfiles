"Basic vim settings

"vImproved
set nocompatible

syntax on

"Colors
set t_Co=256
set background=dark
set t_ut=
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
set listchars=tab:->,eol:^,trail:_

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
au FileType java setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType javascript setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType javascript.jsx setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType json setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType go setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 noexpandtab
au FileType jinja setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType bash setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=100 expandtab
au FileType shell setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=100 expandtab
au FileType zsh setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=100 expandtab
au FileType twig setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au FileType yaml setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
au FileType vim setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab

" Change the statusline, normally overwritten by airline.vim
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
inoremap <C-d> <C-x><C-]>

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

"Mappings for to diff two buffers
nnoremap <Leader>D :windo diffoff<CR>

" Toggle listing invisible chars
nmap <silent> <Leader>5 :set list!<CR>
" Toggle line numbers
nmap <silent> <Leader>6 :set relativenumber! number!<CR>

" Map autocomplete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
