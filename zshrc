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

bindkey -v
bindkey '^R' history-incremental-search-backward

# Customize to your needs...
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
alias ls='ls -lhG'
alias vi='vim'
#alias en4ip="ifconfig | grep -A1 en4 | tail -n1 | awk 'BEGIN { FS=\" \" }; {print \$2}'"
alias en4ip="ifconfig | grep -Eo '169.254.\d{1,3}.\d{1,3}' | head -n1"

if [ -f ~/.common_shell_functions ]; then
    . ~/.common_shell_functions
fi

if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi
