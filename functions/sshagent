function sshagent() {
	killall -9 ssh-agent
	rm -rf /tmp/ssh-*
	eval "$(ssh-agent)"
	ssh-add
}

