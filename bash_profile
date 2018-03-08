# Load my aliases
source ~/.bash_aliases

# Automcomplete git commands
source ~/.git-completion.bash
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_committer_name() {
    git config user.email
}

# Show branch name and other info
# export PS1="\u@ \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\e[0;34m\]\$(parse_committer_name)\[\033[00m\] \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH="/usr/local/mysql/bin:$PATH"

# Golang configuration
export GOPATH="$HOME/work"

# Composer
PATH=$PATH:$GOPATH/bin:$HOME/.composer/vendor/bin

# Python
export PYTHONPATH=$PYTHONPATH:/usr/local/bin/
