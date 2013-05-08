# Set custom OS X PATH
if [[ "$(uname -s)" == "Darwin" ]]; then
	export PATH=~/pebble-dev/arm-cs-tools/bin:$PATH
fi
