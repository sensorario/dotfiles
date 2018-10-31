# Load my aliases
source ~/.bash_aliases

# Automcomplete git commands
source ~/.git-completion.bash

gitprompt() {
        git status | grep -E 'Untracked|Changes to|On branch|Changes not' | \
            sed 's/Changes to be committed:/*/; s/Untracked files:/+/; s/On branch //; s/Changes not staged for commit:/~/' | \
            paste -sd "_" - | \
            sed 's/\_/ /;' | \
            sed 's/\_//g;'
}

prompt=""
prompt+="\[\e[7;34m\] "
prompt+="\$(committerName) "
prompt+="\[\e[0;34m\]"
prompt+=" \W \[\e[7;33m\]"
prompt+=" \$(gitprompt) "
prompt+="\[\e[0;33m\] "
prompt+="\[\e[0m\]"

export PS1=$prompt

export PATH="/usr/local/mysql/bin:$PATH"

# Golang configuration
export GOPATH="$HOME/work"

# Composer
PATH=$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Python
export PYTHONPATH=$PYTHONPATH:/usr/local/bin/

# Makefile completion
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
export HISTTIMEFORMAT="%Y "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export JOLIE_HOME="/usr/local/lib/jolie"
