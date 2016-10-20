#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

bindkey -v

export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

bindkey -M viins 'kj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

# Customize to your needs...
if [ -f /usr/local/bin/server_selector ]; then
    /bin/bash /usr/local/bin/server_selector
fi
