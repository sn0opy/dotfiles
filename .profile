source ~/.git-completion.sh
source ~/.git-prompt.sh
source /etc/profile.d/fzf.bash
source /etc/profile.d/fzf-extras.bash
source /etc/profile.d/autojump.bash

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

[ -z "$PS1" ] && return

tp() {
	if [ -n "$1" ] ; then
			curl -w "%{url_effective}\n" -L -s $URL -o /dev/null -F "file=@$1" http://paste.534f.de/add
	fi
}

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ta='tmux attach'

export PS1='$(__git_ps1 "(%s) ")\[\033[1;34m\]\w\[\033[0m\]\$ '

export PATH="/usr/local/sbin:$PATH"
export PATH="/home/sascha/.gem/ruby/2.3.0/bin:$PATH"
export EDITOR="vim"
export GPG_TTY=$(tty)
export LESS="-x4"

export HISTFILE=~/.bash_history
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

