if [[ "$OSTYPE" == linux* ]]; then
	# some better colors for ls
	if [[ -x `which dircolors` ]] ; then
		eval "`dircolors ~/.dircolors`"
	fi

	zle-line-init () { echo -n "$bellchar" }
	zle -N zle-line-init

	if [[ -x `which pacman` ]]; then
		alias p='s pacman '
	fi

	if [[ -x `which systemctl` ]]; then
		alias sc='s systemctl '
	fi

	# colors in framebuffer
	if [[ $TERM = "linux" ]]; then
		${HOME}/bin/parse_xdefaults.sh
		clear #for background artifacting
	fi

fi

