[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/profile.d/fzf-extras.bash ] && source /etc/profile.d/fzf-extras.bash
[ -f /etc/profile.d/autojump.bash ] && source /etc/profile.d/autojump.bash

[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ta='tmux attach'
alias vim='nvim'

export PS1='$(__git_ps1 "(%s) ")\[\033[1;34m\]\w\[\033[0m\]\$ '

export PATH="/usr/local/sbin:$PATH"
export PATH="~/.composer/vendor/bin:$PATH"
export EDITOR="vim"
export GPG_TTY=$(tty)
export LESS="-x4"

export HISTFILE=~/.bash_history
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
