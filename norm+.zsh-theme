CURUSER=$("whoami")
PROMPT='%{$fg[yellow]%}λ %m %{$fg[green]%}%c %{$fg[yellow]%}→ $(git_prompt_info)%{$reset_color%}'

if [[ "$CURUSER" == "root" ]]; then
PROMPT='%{$fg[red]%}λ %m %{$fg[green]%}%c %{$fg[yellow]%}# $(git_prompt_info)%{$reset_color%}'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="λ %{$fg[blue]%}git %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%} → %{$reset_color%}"
