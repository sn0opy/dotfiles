if [[ "$OSTYPE" == linux* ]]; then
  source '/usr/share/zsh-antidote/antidote.zsh'

  # some better colors for ls
  if [[ -x `which dircolors` ]] ; then
    eval "`dircolors ~/.dircolors`"
  fi

  zle-line-init () { echo -n "$bellchar" }
  zle -N zle-line-init

  # colors in framebuffer
  if [[ $TERM = "linux" ]]; then
    ${HOME}/bin/parse_xdefaults.sh
    clear
  fi

  export GOPATH=$HOME/go
fi

