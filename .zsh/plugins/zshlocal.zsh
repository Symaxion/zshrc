# Load local stuff

zshlocal_has_help=1

zshlocal_help() {
    cat << 'EOF'

    ZshLocal - Load local settings per computer.
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

EOF
}

if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi
