# Case insenstive completion

cicompletion_has_help=1

cicompletion_help() {
    cat << 'EOF'

    %BCiCompletion%b - case-insensitive completion
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
