fpath=($DOTFILES/functions $fpath)

if [[ -d "/usr/local/share/zsh-completions" ]]; then
	fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [[ -d "/usr/share/zsh/site-functions" ]]; then
	fpath=(/usr/share/zsh/site-functions $fpath)
fi

autoload -U $DOTFILES/functions/*(:t)

zle -N newtab

# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search
# bindkey '^[^[[C' forward-word
# bindkey '^[^[[D' backward-word
# bindkey '^[[5D' beginning-of-line
# bindkey '^[[5C' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '^[^N' newtab
# bindkey '^?' backward-delete-char
