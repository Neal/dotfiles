# Abort if we don't have mosh
type mosh &> /dev/null || return 1

# Enable mouse over mosh
# https://github.com/keithw/mosh/issues/101#issuecomment-12317162
function moshm() {
	perl -E ' print "\e[?1005h\e[?1002h" ' # enable mouse mode
	mosh "$@"
	perl -E ' print "\e[?1005l\e[?1002l" ' # disable mouse mode
}
