# reload the zsh config
alias reload!='. ~/.zshrc'

# use git’s colored diff because it's the best
alias diff='git diff --no-index --color-words "$@"'

# all the dig info
alias digga='dig +nocmd "$1" any +multiline +noall +answer'

# create a new directory and enter it
alias mkd='mkdir -p "$@" && cd "$@"'
