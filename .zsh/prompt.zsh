# prompt
setopt prompt_subst

PROMPT='
%{%f%F{yellow}%}%m%{%f%F{white}%} $(git_super_status) : %{%f%F{green}%}%6~%{%f%}
%{%(!.%F{red}%}#%{.%F{white}%}$%{)%f%} '
