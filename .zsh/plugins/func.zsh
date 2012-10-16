func_has_help=1

func_help() {
    cat << 'EOF'

    Func - collection of useful functions
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

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
