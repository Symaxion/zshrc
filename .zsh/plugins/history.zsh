# History settings

history_has_help=1

history_help() {
    cat << 'EOF'

    History - enable command history
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

EOF
}

export HISTSIZE=1000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt appendhistory
setopt extended_history
setopt hist_verify
setopt share_history
