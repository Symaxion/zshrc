# Load local stuff

ctrlr_has_help=1

ctrlr_help() {
    cat << 'EOF'

    %BCtrlR%b - Enables Ctrl-R for history search
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDependencies%b: None
    %BKnown conflicts%b: None

EOF
}

bindkey "^R" history-incremental-search-backward
