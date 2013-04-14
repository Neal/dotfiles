# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null); then
	alias ls="gls -F --color"
	alias l="gls -lAh --color"
	alias ll="gls -l --color"
	alias la='gls -lA --color'
else
	if [[ "$(uname -s)" == "Linux" ]]; then
		export LSCOLORS="Gxfxcxdxbxegedabagacad"
		ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
	fi
	alias ls='ls -F'
	alias l='ls -lAh'
	alias ll='ls -l'
	alias la='ls -lA'
fi

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

# Show history
alias history='fc -l 1'

alias afind='ack-grep -il'
