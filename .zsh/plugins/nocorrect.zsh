nocorrect_has_help=1

nocorrect_help() {
    cat << 'EOF'

    %BNoCorrect%b - do not attempt corrections on certain commands.
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias touch='nocorrect touch'
alias sudo='nocorrect sudo'
alias wine='nocorrect wine'
