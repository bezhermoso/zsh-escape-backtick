# Expands `` to \`
function expand-double-backtick-to-escaped-backtick {
  if [[ $LBUFFER = *\` ]]; then
    zle backward-delete-char
    LBUFFER+='\`'
  else
    LBUFFER+='`'
  fi
}

zle -N expand-double-backtick-to-escaped-backtick

bindkey "\`" expand-double-backtick-to-escaped-backtick

