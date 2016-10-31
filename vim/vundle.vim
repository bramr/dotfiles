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

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'bramr/molokai'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'Raimondi/delimitMate'

"PHP
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'

"CSS
Bundle 'gko/vim-coloresque'

"minor
Bundle 'vim-scripts/nginx.vim'
Bundle 'honza/dockerfile.vim'
Bundle 'chikamichi/mediawiki.vim'
Bundle 'elzr/vim-json'
Bundle 'freitass/todo.txt-vim'

