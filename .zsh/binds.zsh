bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char

# fallback for macOS / iterm
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
