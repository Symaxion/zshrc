manpre_has_help=1

manpre_help() {
    cat << 'EOF'

    %BManPre%b - open man pages in Preview
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

manpre () { 
    man -t $@ | open -f -a /Applications/Preview.app 
}
