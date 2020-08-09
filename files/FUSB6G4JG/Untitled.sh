  function fzf-z-search() {
    local res
    res=$(find ${1:-.} -type d -not -iwholename '*.git*' 2> /dev/null | fzf +m --prompt 'FindFile> ' --height 40% --reverse)
    if [ -n "$res" ]; then
      BUFFER+="cd $res"
      zle accept-line
    else
      zle redisplay
      return 1
    fi
  }
  zle -N fzf-z-search
  bindkey '^F' fzf-z-search
  bindkey '^Xs' fzf-z-search

  function fzf-command-search-widget() {
    LBUFFER="${LBUFFER}$(whence -pm '*' | xargs -i basename {} | fzf --prompt 'SearchCommand> ' --height 40% --reverse)"
    local ret=$?
    zle reset-prompt
    return $ret
  }
  zle -N fzf-command-search-widget
  bindkey '^Xc' fzf-command-search-widget
  bindkey '^o' fzf-command-search-widget

  function __gsel() {
    local cmd="command git ls-files"
    setopt localoptions pipefail 2> /dev/null
    eval "$cmd" | $(__fzfcmd) --prompt "GitFiles> " --height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_CTRL_T_OPTS -m "$@" | while read item; do
      echo -n "${(q)item} "
    done
    local ret=$?
    echo
    return $ret
  }

  function fzf-git-files-widget() {
    LBUFFER="${LBUFFER}$(__gsel)"
    local ret=$?
    zle reset-prompt
    return $ret
  }
  zle     -N   fzf-git-files-widget
  bindkey '^B' fzf-git-files-widget
  bindkey '^Xg' fzf-git-files-widget

  function gadd() {
    local selected
    selected=$(stdbuf -oL git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
    if [[ -n "$selected" ]]; then
      selected=$(tr '\n' ' ' <<< "$selected")
      git add $(echo $selected)
      echo "Completed: git add $selected"
    fi
  }

  function vim-fzf-find() {
    local FILE
    FILE=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | fzf +m)
    if [ -n "$FILE" ]; then
      ${EDITOR:-vim} $FILE
    fi
  }
  alias fzf-vim=vim-fzf-find
  zle     -N   vim-fzf-find
  bindkey '^Xv' vim-fzf-find
  bindkey '^y' vim-fzf-find

  function _fzf_grep() {
    local selected
    selected=$("$@" | fzf --prompt "Grep> " -m --ansi --preview='
        f=$(echo {} | cut -d : -f 1); n=$(echo {} | cut -d : -f 2) &&
          (bat --color=always --style=grid <(tail +$n $f) ||
            highlight -O ansi -l <(tail +$n $f) ||
            coderay <(tail +$n $f) ||
            rougify <(tail +$n $f) ||
            tail +$n $f) 2> /dev/null')
    if [[ -n "$selected" ]]; then
      selected=$(tr '\n' ' ' <<< "$(echo $selected | cut -d : -f 1)")
      vi $(echo $selected)
    fi
  }
  function fzfag() {
    _fzf_grep ag $@
  }
  function fzfrg() {
    _fzf_grep rg -n $@
  }
