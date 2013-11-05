# Set custom OS X PATH. Abort if not OS X.
[[ "$OSTYPE" =~ ^darwin ]] || return 1
	# Pebble SDK
	export PATH=$HOME/pebble-dev/arm-cs-tools/bin:$PATH
	# Coreutils
	export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi
