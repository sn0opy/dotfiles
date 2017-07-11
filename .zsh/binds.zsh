bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# fallback for macOS / iterm
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
