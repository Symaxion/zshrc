func_has_help=1

func_help() {
    cat << 'EOF'

    %BFunc%b - collection of useful functions
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

take() {
    mkdir -p "$1" && cd "$1"
}

title() {
    echo -ne "\033]2;$*\007"
}

pause() {
    echo "Press any key to continue..."
    stty -echo
    read -k
    stty echo
}
