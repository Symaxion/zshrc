# Dotfiles

dotfiles_has_help=1

dotfiles_help() {
    cat << 'EOF'

    Dotfiles - make managing repos of dotfiles easier
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

    Options:
        DOTFILES_LOCATION [$HOME/dotfiles]  Location of the dotfiles repo.

EOF
}

if [[ -z $DOTFILES_LOCATION ]]; then
    DOTFILES_LOCATION="$HOME/dotfiles"

dotfiles() {
    "$DOTFILES_LOCATION/dotfiles.sh" "$@"
}

