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

#Source local aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

bindkey -v

export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

#Setup custom hotkeys for zsh modes
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

bindkey -v
bindkey '^R' history-incremental-search-backward

if [ -f /usr/local/bin/server_selector ]; then
    /bin/bash /usr/local/bin/server_selector
fi

#Enable virtualenvwrapper if available
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi

#The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/adam/google-cloud-sdk/path.zsh.inc ]; then
    source '/Users/adam/google-cloud-sdk/path.zsh.inc'
fi
# The next line enables shell command completion for gcloud.
if [ -f /Users/adam/google-cloud-sdk/completion.zsh.inc ]; then
    source '/Users/adam/google-cloud-sdk/completion.zsh.inc'
fi

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

alias en4ip="ifconfig | grep -Eo '169.254.\d{1,3}.\d{1,3}' | head -n1"

#Bash/zsh common functions
if [ -f ~/.common_shell_functions ]; then
    . ~/.common_shell_functions
fi

#Zsh plugins
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
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
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

#rust
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi
