# Fix the navigation keyblock.

keyblock_has_help=1

keyblock_help() {
    cat << 'EOF'

    Keyblock - fixes the navigation keyblock
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

EOF
}

bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
