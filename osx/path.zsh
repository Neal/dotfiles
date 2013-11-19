# Set custom OS X PATH. Abort if not OS X.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Coreutils
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
