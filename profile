# Load my aliases
source ~/.bash_aliases

# Automcomplete git commands
source ~/.git-completion.bash
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Show branch name and other info
export PS1="\u@ \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH="/usr/local/mysql/bin:$PATH"
