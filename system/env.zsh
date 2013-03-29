if [[ "$(uname -s)" == "Darwin" ]]; then
	export VISUAL='subl'
else
	export VISUAL='vim'
fi

export EDITOR='vim'

alias q="$EDITOR"
alias q.='q .'
