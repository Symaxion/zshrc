[[ $TERM = *xterm* ]] || return

zmodload -i zsh/parameter

zle-xterm-mouse() {
  emulate -L zsh
  setopt extendedglob # for (#b)
  local bt mx my cx cy i match mbegin mend text
  integer rel

  read -k bt # mouse button, x, y reported after \e[M
  read -k mx
  read -k my
  if [[ $bt != "#" ]]; then
    # Process on release, but record the button on press.
    ZLE_MOUSE_BUTTON=$bt
    return
  fi

  print -n '\e[6n' # query cursor position
  while read -k i && [[ $i != R ]]; do cx+=$i; done
  # can't use read -d R in zle

  [[ $cx = (#b)??(*)\;(*) ]] || return
  cy=$match[1]
  cx=$match[2]

  # Relative position between cursor and mouse.
  (( rel = #mx - 32 - cx + (#my - 32 - cy) * COLUMNS ))

  case $ZLE_MOUSE_BUTTON in
    (' ')
    # Button 1.  Move cursor.
    (( CURSOR += rel ))
    ;;

    ('!')
    # Button 2.  Insert selection at cursor postion.
    LBUFFER+=$CUTBUFFER
    ;;

    ('"')
    # Button 3.  Copy from cursor to mouse to cutbuffer.
    if (( rel > 0 )); then
      text=${RBUFFER[1,rel]}
    elif (( CURSOR + rel > 0 )); then
      text=${LBUFFER[rel,-1]}
    else
      text=$LBUFFER
    fi
    killring=("$CUTBUFFER" "${(@)killring[1,-2]}")
    CUTBUFFER=$text
    ;;
  esac
  return 0
}

zle-toggle-mouse() {
  # If no prefix, toggle state.
  # If positive prefix, turn on.
  # If zero or negative prefix, turn off.

  # Allow this to be used as a normal function, too.
  if [[ -n $1 ]]; then
    local PREFIX=$1
  fi
  if (( $+PREFIX )); then
    if (( PREFIX > 0 )); then
      ZLE_USE_MOUSE=1
    else
      ZLE_USE_MOUSE=
    fi
  else
    if [[ -n $ZLE_USE_MOUSE ]]; then
      ZLE_USE_MOUSE=
    else
      ZLE_USE_MOUSE=1
    fi
  fi
  if [[ -n $WIDGET ]]; then
    # Zle is currently active.
    # Make sure it's turned on or off straight away if required.
    if [[ -n $ZLE_USE_MOUSE ]]; then
      print -n '\e[?1000h'
    else
      print -n '\e[?1000l'
    fi
  fi
}

if [[ $functions[precmd] != *ZLE_USE_MOUSE* ]]; then
  functions[precmd]+='
  [[ -n $ZLE_USE_MOUSE ]] && print -n '\''\e[?1000h'\'
fi
if [[ $functions[preexec] != *ZLE_USE_MOUSE* ]]; then
  functions[preexec]+='
  [[ -n $ZLE_USE_MOUSE ]] && print -n '\''\e[?1000l'\'
fi

zle -N zle-xterm-mouse
bindkey '\e[M' zle-xterm-mouse

zle -N zle-toggle-mouse

ZLE_USE_MOUSE=1
