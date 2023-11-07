autoload -Uz compinit promptinit colors select-word-style bracketed-paste-magic url-quote-magic zmv
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic
select-word-style bash
compinit -i
promptinit
colors

export REPORTTIME=10
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export GPG_TTY=$(tty)

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

# fzf options
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_OPTS='--color 16'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZPLUG_HOME/init.zsh ] && source $ZPLUG_HOME/init.zsh
[ -f ~/.custom.zsh ] && source ~/.custom.zsh

zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-completions", use:src
zplug "ohmyzsh/ohmyzsh", use:"lib/{spectrum,git}.zsh"
zplug load

unset VIRTUAL_ENV_DISABLE_PROMPT

eval "$(atuin init zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.oh-my-posh.json)"

