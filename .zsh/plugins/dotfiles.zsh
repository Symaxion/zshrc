# Dotfiles

dotfiles_has_help=1

dotfiles_help() {
    cat << 'EOF'

    Dotfiles - make managing repos of dotfiles easier
    Author: Frank Erens <frank@synthi.net>
    Dependencies: None
    Known conflicts: None

    Options:
        DOTFILES_LOCATION           [$HOME/dotfiles]  
                Location of the dotfiles repo.

        DOTFILES_WARN_UPDATE        [1]
                Whether to warn if the dotfiles haven't been updated for a
                while.

        DOTFILES_WARN_TIME          [7]
                Time since last update, in days, after which to start 
                warning about updates.


EOF
}

# Options
if [[ -z $DOTFILES_LOCATION ]]; then
    DOTFILES_LOCATION="$HOME/dotfiles"
fi

if [[ -z $DOTFILES_WARN_UPDATE ]]; then
    DOTFILES_WARN_UPDATE=1
fi

if [[ -z $DOTFILES_WARN_TIME ]]; then
    DOTFILES_WARN_TIME=7
fi

dotfiles_datediff() {
    d1=$(cat "$DOTFILES_LOCATION/.last_update")
    d2=$(date '+%s')
    echo $(( (d2 - d1) / 86400 ));
}

dotfiles() {
    "$DOTFILES_LOCATION/dotfiles.sh" "$@"
}

if [[ $DOTFILES_WARN_UPDATE == 1 && -f "$DOTFILES_LOCATION/.last_update" ]]; 
then
    x=$(dotfiles_datediff)
    if [[ $x -ge $DOTFILES_WARN_TIME ]]; then
        echo "Warning: dotfiles haven't been updated in $x days."
    fi
fi

