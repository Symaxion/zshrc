# More bash-like completion

bashlike_has_help=1

bashlike_help() {
    cat << 'EOF'

    %BBashlike%b - more bash-like completion
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

setopt noalwayslastprompt
setopt noauto_remove_slash
setopt no_list_types
setopt complete_in_word
setopt autolist
setopt no_auto_menu
setopt bash_auto_list
unsetopt menucomplete
zstyle ':completion:*' file-patterns '*(D)' # invisible files
unlimit
