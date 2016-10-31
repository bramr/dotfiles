" Minimal vimrc

"vImproved
set nocompatible

" On Windows, also use: '.vim' instead of: 'vimfiles'
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$VIMHOME/.vim/after
endif

"Manage plugins
source ~/dotfiles/vim/vundle.vim

"Basic settings
source ~/dotfiles/vim/basic.vim

"Plugin settings & keybindings
source ~/dotfiles/vim/vundle-settings.vim

"Machine settings
source ~/dotfiles/vim/local.vim
