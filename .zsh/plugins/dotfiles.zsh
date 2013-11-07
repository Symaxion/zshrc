# Dotfiles

dotfiles_has_help=1

dotfiles_help() {
    cat << 'EOF'

    %BDotfiles%b - make managing repos of dotfiles easier
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

    %BOptions%b:
        %UDOTFILES_LOCATION%u           [$HOME/dotfiles]  
                Location of the dotfiles repo.

        %UDOTFILES_WARN_UPDATE%u        [1]
                Whether to warn if the dotfiles haven't been updated for a
                while.

        %UDOTFILES_WARN_TIME%u          [7]
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

