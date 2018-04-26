# Load my aliases
source ~/.bash_aliases

# Automcomplete git commands
source ~/.git-completion.bash

committerName() {
    git config user.email
}

branchName() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/⎇ \1/'
}

unstaged() {
  [[ $(git status 2> /dev/null | grep "Changes not staged for commit":) != "" ]] && echo "/m"
}

untracked() {
  [[ $(git status 2> /dev/null | grep "Untracked files":) != "" ]] && echo "/u"
}

prompt="\[\e[7;34m\] "                             # start with blue
prompt+="\$(committerName) "                       # show committer name

prompt+="\[\e[0;34m\] "                           # start black backround
prompt+="\W "                                      # show folder name

prompt+="\[\e[7;33m\] "                           # start green backround
prompt+="\$(branchName)\$(untracked)\$(unstaged) " # show branch info

prompt+="\[\e[0;33m\] "                           # start black backround
prompt+="\[\e[0m\]"                                # show prompt

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
