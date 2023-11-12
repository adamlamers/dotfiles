if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f "$(which git)" ] && [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim

function title {
    echo -ne "\033]0;"$*"\007"
}

export HISTFILESIZE=200000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

if [ -f ~/.common_shell_functions ]; then
    . ~/.common_shell_functions
fi

#Enable ~/.ssh/config host tab completion
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}

complete -F _complete_ssh_hosts ssh
complete -F _complete_ssh_hosts scp
. "$HOME/.cargo/env"
