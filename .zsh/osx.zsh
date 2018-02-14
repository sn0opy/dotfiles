if [[ "$OSTYPE" == darwin* ]]; then
	export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

	export PATH=$PATH:$HOME/composer/vendor/bin
	export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
	export PATH=$PATH:/usr/local/opt/ruby/bin

	export LC_ALL="en_US.UTF-8"
	export EDITOR="vim"
	export VISUAL="vim"
	export HOMEBREW_NO_ANALYTICS=1

	alias ls="ls -G"
	alias lt="ls -tcr"
	alias llt="l -tcr"

	if [ "$TMUX" = "" ]; then
		tmux; 
	fi
fi
