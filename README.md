Installation
----
The install script will not overwrite any actual files in your home directory -
dotbot will report a failure to link.

    cd ~
    git clone https://github.com/adamlamers/dotfiles .dotfiles_git
    cd ~/.dotfiles_git
    ./install


My dotfiles
----

Features:

Shell (zsh/bash) utility functions such as:
- pubkey
- pwgen
- encrypt
- decrypt
- download_bootstrap
- init_flask
- weather

Zsh configured for:
- zprezto
- zsh-autosuggestions
- zsh-syntax-highlighting

My Vim setup designed to work lightweight on servers or heavyweight for personal use.

- Monokai color scheme
- Some standard sanity settings

vim will try to bootstrap vim-plug with cURL and install plugins on launch
