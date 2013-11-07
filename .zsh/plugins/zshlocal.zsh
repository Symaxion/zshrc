# Load local stuff

zshlocal_has_help=1

zshlocal_help() {
    cat << 'EOF'

    %BZshLocal%b - Load local settings per computer.
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi
