#!/bin/sh

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Remove outdated versions from the cellar
brew cleanup

exit 0
