"Experimental neovim config

"Install dein from github if not available
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
call dein#add('xolox/vim-easytags')
call dein#add('xolox/vim-misc')
call dein#add('majutsushi/tagbar')

"git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('jreybert/vimagit')
call dein#add('mxw/vim-jsx')

"javascript
call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
call dein#add('ternjs/tern_for_vim', {'build': 'npm install', 'on_ft': 'javascript'})
call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install -g tern', 'on_ft': 'javascript'})

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
call dein#add('zchee/deoplete-go', {'build': 'make'})

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

"optional
if has('mac')
  call dein#add('xolox/vim-notes')
  call dein#add('rizzatti/dash.vim')
endif
if exists('g:bramr_devicons')
  call dein#add('ryanoasis/vim-devicons')
endif

"Pretty colors
call dein#add('bramr/molokai')

call dein#end()
