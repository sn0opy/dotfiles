bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char

# alt + left/right
bindkey "^[[1;9D" backward-word
bindkey "^[[1;9C" forward-word

if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  bindkey "^[[1;5D" backward-word # CTRL + Left
  bindkey "^[[1;5C" forward-word  # CTRL + Right
fi

# fallback for macOS / iterm
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
