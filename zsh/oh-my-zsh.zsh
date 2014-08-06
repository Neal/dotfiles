ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="lust"

DISABLE_AUTO_UPDATE="true"

plugins=(autoenv battery colored-man command-not-found cp encode64 extract history gem git gitfast gitignore git-extras mosh npm pip python rsync safe-paste screen sudo systemadmin tmux tmuxinator urltools virtualenv vundle wd zsh_reload)

if [[ "$OSTYPE" =~ ^darwin ]]; then
	plugins=(${plugins[@]} brew brew-cask cloudapp copydir copyfile osx sublime vagrant xcode)
elif [ -f /etc/debian_version ]; then
	plugins=(${plugins[@]} debian)
fi
