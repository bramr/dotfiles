" Install vim-plug from github if not available
if !filereadable(expand(g:bramr_vimpath.'autoload/plug.vim'))
  echo "Installing Vim-Plug"
  silent execute '!curl -fLo ' . g:bramr_vimpath . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

"Plugin manager
call plug#begin(g:bramr_vimpath.'plugged')

"General stuff
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'freitass/todo.txt-vim'

"Coding stuff
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
"Language specific
Plug 'StanAngeloff/php.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'gko/vim-coloresque', {'for': 'css'}

"minor
Plug 'vim-scripts/nginx.vim'
Plug 'honza/dockerfile.vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'elzr/vim-json', {'for': 'json'}

"Pretty colors
Plug 'bramr/molokai'

"Optional
if has('mac')
  Plug 'rizzatti/dash.vim'
endif

call plug#end()
