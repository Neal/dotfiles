# Set custom OS X PATH
if [[ "$(uname -s)" == "Darwin" ]]; then
	# Pebble SDK
	export PATH=$HOME/pebble-dev/arm-cs-tools/bin:$PATH
	# Coreutils
	export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi
