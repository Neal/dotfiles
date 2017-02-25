# kill an open (probably broken) rsub connection
# only use it if you see "Warning: remote port forwarding failed for listen port 52698"
# or your current shell will die
function killrsub() {
	sudo kill -9 $(sudo netstat -plnt | grep 52698 | grep -v tcp6 | awk '{print $7;}' | cut -d'/' -f1)
}
