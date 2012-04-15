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
