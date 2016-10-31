"      __                    _                                  __  _
"   /\ \ \ ___   ___ __   __(_) _ __ ___     ___  ___   _ __   / _|(_)  __ _
"  /  \/ // _ \ / _ \\ \ / /| || '_ ` _ \   / __|/ _ \ | '_ \ | |_ | | / _` |
" / /\  /|  __/| (_) |\ V / | || | | | | | | (__| (_) || | | ||  _|| || (_| |
" \_\ \/  \___| \___/  \_/  |_||_| |_| |_|  \___|\___/ |_| |_||_|  |_| \__, |
"                                                                      |___/

let g:bramr_vimpath = '~/.config/nvim/'

"Add plugins managed by plug
source ~/dotfiles/vim/plug.vim

"Basic settings & keybindings
source ~/dotfiles/vim/basic.vim

"Add plugin settings (managed by plug)
source ~/dotfiles/vim/plug-settings.vim

"Machine settings
source ~/dotfiles/vim/local.vim
