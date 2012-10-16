# Case insenstive completion

cicompletion_has_help=1

cicompletion_help() {
    cat << 'EOF'

    CiCompletion - case-insensitive completion
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

EOF
}

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
