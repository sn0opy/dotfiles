bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char

# alt + left/right
bindkey '^[[1;9D' backward-word
bindkey '^[[1;9C' forward-word

# fallback for macOS / iterm
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
