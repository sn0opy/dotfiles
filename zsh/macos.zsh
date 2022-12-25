if [[ "$OSTYPE" == darwin* ]]; then
  export HOMEBREW_NO_ENV_HINTS=1

  export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

  export PATH=$HOME/.composer/vendor/bin:$PATH
  export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
  export PATH=$HOME/go/bin:$PATH
  export PATH=$HOME/.fastlane/bin:$PATH
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export ZPLUG_HOME=/opt/homebrew/opt/zplug

  export LC_ALL="en_US.UTF-8"
  export EDITOR="vim"
  export VISUAL="vim"
  export HOMEBREW_NO_ANALYTICS=1
  export JAVA_HOME=`/usr/libexec/java_home`

  alias ls="ls -G"
  alias lt="ls -tcr"
  alias llt="l -tcr"

  alias k="kubectl"

  if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
  fi
fi
