if [[ "$OSTYPE" == darwin* ]]; then
  source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

  export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

  export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
  export PATH=$HOME/go/bin:$PATH
  export PATH=$HOME/.rd/bin:$PATH
  export PATH=/usr/local/opt/ruby/bin:$PATH

  export LC_ALL="en_US.UTF-8"
  export EDITOR="vim"
  export VISUAL="vim"
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_ENV_HINTS=1
  export JAVA_HOME=`/usr/libexec/java_home`

  alias ls="ls -G"
  alias lt="ls -tcr"
  alias llt="l -tcr"
  alias k="kubectl"
fi
