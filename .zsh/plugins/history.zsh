# History settings

history_has_help=1

history_help() {
    cat << 'EOF'

    %BHistory%b - enable command history
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

export HISTSIZE=1000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt appendhistory
setopt extended_history
setopt hist_verify
setopt share_history
