fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

zle -N newtab

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[^[[C' forward-word
bindkey '^[^[[D' backward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
