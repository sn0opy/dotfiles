if [[ "$OSTYPE" == linux* ]]; then
  # some better colors for ls
  if [[ -x `which dircolors` ]] ; then
    eval "`dircolors ~/.dircolors`"
  fi

  zle-line-init () { echo -n "$bellchar" }
  zle -N zle-line-init

  # colors in framebuffer
  if [[ $TERM = "linux" ]]; then
    ${HOME}/bin/parse_xdefaults.sh
    clear #for background artifacting
  fi

  export GOPATH=$HOME/go
  export ZPLUG_HOME=$HOME/.zplug
fi

