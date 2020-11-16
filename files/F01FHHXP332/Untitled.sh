  if builtin command -v gitprompt > /dev/null 2>&1; then
    ZSH_THEME_GIT_PROMPT_PREFIX=""
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
    typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='$(gitprompt)'
    typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='$(gitprompt)'
  else
    # Install our own Git status formatter.
    typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
    typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
  fi