manpre_has_help=1

manpre_help() {
    cat << 'EOF'

    ManPre - open man pages in Preview
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

EOF
}

manpre () { 
    man -t $@ | open -f -a /Applications/Preview.app 
}
