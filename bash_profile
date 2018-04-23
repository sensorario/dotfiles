# Load my aliases
source ~/.bash_aliases

# Automcomplete git commands
source ~/.git-completion.bash

committerName() {
    git config user.email
}

branchName() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1/'
}

unstaged() {
  [[ $(git status 2> /dev/null | grep "Changes not staged for commit":) != "" ]] && echo "/*)"
}

export PS1="\[\e[0;34m\]\$(committerName)\[\033[00m\] \[\033[32m\]\W\[\033[33m\]\$(branchName)\[\033[00m\]\[\033[33m\]\$(unstaged)\[\033[00m\] $ "

export PATH="/usr/local/mysql/bin:$PATH"

# Golang configuration
export GOPATH="$HOME/work"

# Composer
PATH=$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Python
export PYTHONPATH=$PYTHONPATH:/usr/local/bin/

# Makefile completion
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
