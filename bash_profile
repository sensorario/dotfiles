# Load my aliases
source ~/.bash_aliases

# Automcomplete git commands
source ~/.git-completion.bash

gitprompt() {
    if [ -f $PWD/.git/config ]; then
        git status | grep -E 'Untracked|Changes to|On branch|Changes not' | \
            sed 's/Changes to be committed:/*/; s/Untracked files:/+/; s/On branch //; s/Changes not staged for commit:/~/' | \
            paste -sd "±" - | \
            sed 's/±/ /; ' | \
            sed 's/±//g;'
    fi;
}

prompt=""
prompt+=" \W \[\e[7;34m\]"
prompt+=" \$(gitprompt) "
prompt+="\[\e[0;34m\]"
prompt+=" \[\e[7;39m\]"
#prompt+=" \$(committerName) "
prompt+="\[\e[0;39m\] "

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

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
eval "$(jump shell --bind=j)"

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#zsh

_ff='commit complete feature help hotfix publish refactor reset status' && complete -W "${_ff}" 'ff'
