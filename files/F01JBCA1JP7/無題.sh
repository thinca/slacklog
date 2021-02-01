#autoload

local out=$(echo "$BUFFER" | fzf-preview-zsh auto-snippet)

if [[ $(echo "$out" | head -1) != "success" ]]; then
  LBUFFER+=" "
  return
fi

local snippet=$(echo "$out" | head -2 | tail -1)
local cursor=$(echo "$out" | head -3 | tail -1)

if [[ $snippet != "" ]]; then
  BUFFER=$snippet
  CURSOR=$cursor
fi