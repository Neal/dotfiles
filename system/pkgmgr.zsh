if [[ "$(uname -s)" == "Linux" ]]; then

	alias apt-update="sudo apt-get -qq update && sudo apt-get upgrade && sudo apt-get dist-upgrade"
	alias apt-install="sudo apt-get install"
	alias apt-remove="sudo apt-get remove"
	alias apt-search="apt-cache search"

elif [[ "$(uname -s)" == "Darwin" ]]; then

	alias brew-update="brew update && brew upgrade"
	alias brew-install="brew install"
	alias brew-uninstall="brew uninstall"
	alias brew-remove="$uninstall"

	alias supdate="sudo softwareupdate -ia"
fi
