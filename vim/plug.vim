" Install vim-plug from github if not available
if !filereadable(expand(g:bramr_vimpath.'autoload/plug.vim'))
  echo "Installing Vim-Plug"
  silent execute '!curl -fLo ' . g:bramr_vimpath . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

"Plugin manager
call plug#begin(g:bramr_vimpath.'plugged')

"General stuff
Plug 'junegunn/fzf', { 'do': './install', 'merged': 0 }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}

Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Coding stuff
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'bramr/vim-snippets'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'mxw/vim-jsx'

"javascript
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/jsdoc-syntax.vim', {'for':['javascript', 'typescript']}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': 'javascript'}

"php
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
Plug 'tobyS/vmustache', {'for': 'php'}
Plug 'tobyS/pdv', {'for': 'php'}
Plug 'lepture/vim-jinja', {'for':['twig', 'jinja']}

"go
Plug 'fatih/vim-go', {'for': 'go'}

"html&css
Plug 'mattn/emmet-vim', {'for': ['html', 'twig']}
Plug 'gko/vim-coloresque', {'for': 'css'}

"minor
Plug 'vim-scripts/nginx.vim'
Plug 'honza/dockerfile.vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'freitass/todo.txt-vim'
Plug 'tpope/vim-surround'

"Pretty colors
Plug 'bramr/molokai'

"Optional
if has('mac')
  Plug 'xolox/vim-notes'
  Plug 'rizzatti/dash.vim'
endif
if exists('g:bramr_devicons')
  Plug 'ryanoasis/vim-devicons'
endif

call plug#end()
