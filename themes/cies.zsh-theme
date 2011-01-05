# Cies Breijs' Oh-my-zsh theme
# 
# Typical prompt is 3 lines; a blank line, a status line and the actual prompt.
# Features:
#  * no right aligning anything, everything to the left
#  * username, full hostname, full path, rvm, git (optional), full date
#  * continuation prompt
#  * non zero return values are shown
#
# TODO:
#  * hashmap hostnames to a list of readable fg/bg color combinations, for an 
#         automated yet deterministic color coding for each hostname 

# bits and pieces
local continuation="%{$fg[white]%}...%{$fg[black]%}#%{$reset_color%}"
local separator="%{$fg[green]%} » %{$reset_color%}"
local return_code="%{$fg[red]%}←  %?%{$reset_color%}"
local user_host_and_path=$'%(!.%{$fg_bold[red]%}.%{$fg[green]%})%n%{$reset_color%}%{$fg[white]%}@%{$fg[green]%}%M%{$fg_bold[white]%}:%{$reset_color%}%{$fg[green]%}$(pwd)${separator}'
local rvm_status='$([ -s ~/.rvm/bin/rvm-prompt ] && echo "%{$fg[blue]%}rvm:(%{$fg[cyan]%}$(v=$(~/.rvm/bin/rvm-prompt i v g); if [ $v ]; then echo $v; else echo "none"; fi)%{$fg[blue]%})%{$reset_color%}${separator}")'
local git_status=$'%{$(git_prompt_info)%}'
local date_and_time="%{$fg[blue]%}%D{%a %F %H:%M:%S (%Z)}%{$reset_color%}"
local arrow="%(!.%{$fg[red]%}.%{$fg[green]%})➜  %{$reset_color%}"

# the main prompt
PROMPT="%(?..${return_code}
)
${user_host_and_path}${rvm_status}${git_status}${date_and_time}
${arrow}"

# the continuation prompt
PROMPT2="${continuation}${arrow}"

# theming the git bit
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${separator}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
