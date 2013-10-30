ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lust"

DISABLE_AUTO_UPDATE="true"

plugins=(autoenv battery colored-man cp extract history gem git gitfast gitignore git-extras lol mosh npm python rsync safe-paste screen tmux tmuxinator vundle)

if [[ "$(uname -s)" == "Darwin" ]]; then
	plugins=(${plugins[@]} brew copydir copyfile osx sublime)
elif [ -f /etc/debian_version ]; then
	plugins=(${plugins[@]} debian)
fi
