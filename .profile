source .git-completion.sh
source .git-prompt.sh

[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ta='tmux attach'

export PS1='$(__git_ps1 "(%s) ")\[\033[1;35m\]\w\[\033[0m\]\$ '

export PATH="/usr/local/sbin:$PATH"
export EDITOR="vim"
export GPG_TTY=$(tty)
