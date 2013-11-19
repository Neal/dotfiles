if [[ -x $(which subl) ]]; then
	export VISUAL='subl'
else
	export VISUAL='vim'
fi

export EDITOR='vim'
export PAGER='less'

export TZ="America/Chicago"
