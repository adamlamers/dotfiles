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

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export HISTSIZE=10000
export HISTFILESIZE=1000000000
export HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

#Setup custom hotkeys for zsh modes
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

bindkey -v
bindkey '^R' history-incremental-search-backward

#Custom utilities

#Change ls alias based on host OS
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    alias ls='ls -lh --color=auto'
elif [[ "$unamestr" == 'Darwin' ]]; then
    alias ls='ls -lhG'
fi

#Alias vi to vim if vim exists
if which vim >/dev/null; then
    alias vi='vim'
else
    #Otherwise alias vi to vim
    alias vim='vi'
fi

#Bash/zsh common functions
if [ -f ~/.common_shell_functions ]; then
    . ~/.common_shell_functions
fi

#pyenv
if [ -f "$HOME/.pyenv/bin/pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

#nvm
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@" # lazy load nvm so shells don't take forever
fi

#rust
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi
