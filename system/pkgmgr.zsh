if [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]]; then

	alias update="sudo apt-get -qq update && sudo apt-get upgrade && sudo apt-get dist-upgrade"
	alias install="sudo apt-get install"
	alias remove="sudo apt-get remove"
	alias search="apt-cache search"

elif [[ "$(uname -s)" == "Darwin" ]]; then

	alias update="brew update && brew upgrade"
	alias install="brew install"
	alias uninstall="brew uninstall"
	alias remove="$uninstall"

	alias supdate="sudo softwareupdate -ia"
fi
