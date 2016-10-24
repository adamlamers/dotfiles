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
