autoload -Uz compinit promptinit colors select-word-style bracketed-paste-magic url-quote-magic zmv
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic
select-word-style bash
compinit -i
promptinit
colors

# history
setopt hist_ignore_space
setopt append_history
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt share_history
setopt hist_ignore_all_dups
setopt extendedglob
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=500000
export HISTFILE HISTSIZE SAVEHIST
REPORTTIME=10

# env vars
EDITOR=vim
VISUAL=vim
PAGER=less
export EDITOR VISUAL PAGER

# colorful $PAGER
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'

# configuration files
for file in ~/.zsh/*.zsh; do
    source $file
done

# general options
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export GPG_TTY=$(tty)

# fzf options
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_OPTS='--color 16'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZPLUG_HOME/init.zsh ] && source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:github, use:"async.zsh"
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-completions", use:src
zplug load

export ZSH_AUTOSUGGEST_USE_ASYNC=1
unset VIRTUAL_ENV_DISABLE_PROMPT
