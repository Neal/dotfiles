alias tns='tmux new-session -s'
alias tls='tmux list-sessions'
alias tlw='tmux list-windows'
alias tlc='tmux list-commands'
alias tat='tmux attach-session -t'
alias trs='tmux rename-session -t'
alias tks='tmux kill-session -t'

function tmx() {
	tmux attach-session -t $@ || tmux new-session -s $@
}
