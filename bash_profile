if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
fi

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim

function title {
    echo -ne "\033]0;"$*"\007"
}

source /usr/local/bin/virtualenvwrapper.sh

export HISTFILESIZE=200000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

function local_pi() {
LOCAL_PI_IP=$(en4ip)
ssh -b $LOCAL_PI_IP pi@169.254.100.100
}

#################### Project Initialization Tools ###################
function download_bootstrap() {
    mkdir -p static
    mkdir -p static/css
    mkdir -p static/js

    cd static/css
    wget "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
    cd ../
    cd js
    wget "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
    cd ../..
}

function init_flask() {
    mkdir -p templates
    touch templates/index.html
    curl "https://raw.githubusercontent.com/lewagon/bootstrap-boilerplate/gh-pages/index.html" > templates/index.html
    FLASK_TEMPLATE="from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.debug = True
    app.run()
"
    echo "$FLASK_TEMPLATE" > app.py
}

function weather() {
    LOCATION=milwaukee

    curl wttr.in/$LOCATION
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/adam/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/adam/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/adam/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/adam/Downloads/google-cloud-sdk/completion.bash.inc'
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
