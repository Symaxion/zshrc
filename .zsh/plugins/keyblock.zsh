# Fix the navigation keyblock.

keyblock_has_help=1

keyblock_help() {
    cat << 'EOF'

    %BKeyblock%b - fixes the navigation keyblock
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
