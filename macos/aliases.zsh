# Abort if not OS X
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Remove all items safely, to Trash.
alias rm='trash'

# Case-insensitive pgrep that outputs full path.
alias pgrep='pgrep -fli'

# Lock current session and proceed to the login screen.
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Python virtualenv shortcuts.
alias venv-init='virtualenv venv -p /usr/local/bin/python --no-site-packages'
alias venv-activate='source venv/bin/activate'

# Sniff network info.
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias dsstore="find . -name '.DS_Store' -type f -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes/*; sudo rm -rfv ~/.Trash/*; sudo rm -rfv /private/var/log/asl/*.asl'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge='tput bel'

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Put display to sleep
alias afk='pmset displaysleepnow'

# Convert binary plist to xml
function plxml() {
	plutil -convert xml1 $1
}

# Convert xml plist to binary
function plbin() {
	plutil -convert binary1 $1
}
