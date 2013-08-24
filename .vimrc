" Bram Rohde's vimrc
"

"vImproved
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle, required! 
Bundle 'gmarik/vundle'

"My Bundles
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'mattn/zencoding-vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'StanAngeloff/php.vim'

"Colorscheme bundles
Bundle 'tomasr/molokai'
Bundle 'noahfrederick/vim-noctu'

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

"Use light colorscheme for gui, but a good dark otherwise
if has("gui_running") 
  set background=dark
  colorscheme molokai
else
  set background=dark
  colorscheme noctu
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

"setup default whitespaces
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set listchars=tab:>-,eol:^,trail:_

set noeol

"Set spell checking to us english, but disable by default
set spell spelllang=en_us
set nospell

"Yank to OS clipboard
set clipboard+=unnamed

"default file encoding and newline format
set encoding=utf-8
set fileformat=unix

"use incremental search
set incsearch

" remember last 500 commands
set history=500

" Scroll 3 lines ahead
set scrolloff=3

" Write to swap after each 30 keystroaks
set updatecount=30

"Write file contents automatically when exitting buffer
set autowrite

"Change the statusline, Disabled for now, trying powerline
"set statusline=%t\        "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},  "file encoding
"set statusline+=%{&ff}]\  "file format
"set statusline+=%h        "help file flag
"set statusline+=%m        "modified flag
"set statusline+=%r        "read only flag
"set statusline+=%y        "filetype
"set statusline+=%=        "left/right separator
"set statusline+=%c,       "cursor column
"set statusline+=%l/%L     "cursor line/total lines
"set statusline+=\ %P      "percent through file

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

if has("mac")
  set guifont=Menlo:h13
  set columns=95
  set lines=34
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

au FileType html setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
au FileType ruby setl softtabstop=2 tabstop=2 expandtab
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=90 expandtab
au FileType javascript setl softtabstop=2 shiftwidth=2 tabstop=2 textwidth=90 expandtab
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

"Switch windows more easily
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

"easy splitting and back to 1 window
map <C-i> :vsplit<CR>
map <C-u> :split<CR>
map <C-o> <C-w>o
map <C-p> :setl lines=60 columns=272<CR>

"Use Ctrl-F for omni completion
inoremap <C-f> <C-x><C-O>
"Use Ctrl-D for omni completion
inoremap <C-d> <C-x><C-n>

" map CTRL-V to piece-wise copying of the line above the current one
imap <C-V> a<esc>kywgi<esc>Pla<bs>

" map <Leader>f to display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"Quickly set a file to my preferred format
nmap <Leader>e :setl fileencoding=utf-8 fileformat=unix<CR>

" use <F5> to toggle listing invisible chars
nmap <silent> <F5> :set list!<CR>

" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>

" use make command
nmap <Leader>m :make<CR>

"map spellcheck stuff
nmap <Leader>1 [s
nmap <Leader>2 ]s
nmap <Leader>3 z=
nmap <Leader>4 ]sz=
nmap <Leader>7 :setlocal spell spelllang=en_us<CR>:setlocal spell<CR>
nmap <Leader>8 :setlocal spell spelllang=nl<CR>:setlocal spell<CR>
nmap <Leader>9 :setlocal spell spelllang=en_us<CR>:setlocal nospell<CR>


"syntastic syntax checking
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_phpcs_disable=1

"Mappings for CtrlP plugin 
noremap <Leader>t :CtrlP<CR>
noremap <Leader>r :CtrlPBuffer<CR>

"Show/Hide NerdTree
nmap <silent><F7> :NERDTreeToggle<CR>



