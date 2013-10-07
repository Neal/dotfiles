#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew); then
	echo -p "Homebrew is not installed! Would you like to install it? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	fi
	exit
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# Install everything else
brew install ack
brew install automake
brew install autoconf
brew install cmake
brew install git
brew install grc
brew install htop-osx
brew install macvim
brew install mtr
brew install nmap
brew install openssl
brew install python
brew install rename
brew install ruby
brew install sqlite
brew install tmux
brew install tree
brew install unrar
brew install vim
brew install wget
brew install wireshark
brew install zsh

# Remove outdated versions from the cellar
brew cleanup

exit 0
