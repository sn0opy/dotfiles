zmodload zsh/zprof
autoload -Uz compinit colors select-word-style bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic
select-word-style bash
colors
compinit 

zstyle ':completion:*' menu select

export CLICOLOR=1
export REPORTTIME=10
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export FZF_DEFAULT_OPTS='--color 16'

unset HISTFILE
unset VIRTUAL_ENV_DISABLE_PROMPT

for file in $HOME/.zsh/*.zsh; do
    source $file
done

antidote load

_evalcache atuin init zsh
_evalcache oh-my-posh init zsh --config $HOME/.oh-my-posh.json

