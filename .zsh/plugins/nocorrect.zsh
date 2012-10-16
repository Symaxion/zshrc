nocorrect_has_help=1

nocorrect_help() {
    cat << 'EOF'

    NoCorrect - do not attempt corrections on certain commands.
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

EOF
}

alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias touch='nocorrect touch'
