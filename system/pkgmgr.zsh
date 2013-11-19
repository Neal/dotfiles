if [[ -x $(which apt-get) ]]; then
	alias apt-update="sudo apt-get -qq update && sudo apt-get upgrade && sudo apt-get dist-upgrade"
	alias apt-install="sudo apt-get install"
	alias apt-remove="sudo apt-get remove"
	alias apt-search="apt-cache search"
fi

if [[ -x $(which brew) ]]; then
	alias brew-update="brew update && brew upgrade"
fi

if [[ -x $(which softwareupdate) ]]; then
	alias supdate="sudo softwareupdate -ia"
fi
