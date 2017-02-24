# Expands `` to \`
function expand-double-backtick-to-escaped-backtick {
  if [[ $LBUFFER = *[^\\]\` ]]; then
    zle backward-delete-char
    LBUFFER+='\`'
    bindkey '^?' undo-escaped-backtick-or-backward-delete-char
  else
    LBUFFER+='`'
  fi
}

function undo-escaped-backtick-or-backward-delete-char {
  if [[ $LBUFFER = *\` ]]; then
    zle backward-delete-char
    zle backward-delete-char
    LBUFFER+='`'
  fi
  bindkey '^?' backward-delete-char
}

zle -N expand-double-backtick-to-escaped-backtick
zle -N undo-escaped-backtick-or-backward-delete-char

bindkey "\`" expand-double-backtick-to-escaped-backtick

