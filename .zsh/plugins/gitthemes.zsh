gitthemes_has_help=1

gitthemes_help() {
    cat << 'EOF'

    %BGitThemes%b - support for oh-my-zsh themes that show git statuses.
    %BAuthor%b: Frank Erens %U<frank@synthi.net>%u
    %BDepends%b: None
    %BKnown conflicts%b: None
    %BNotes%b: Adapted from oh-my-zsh

EOF
}

setopt prompt_subst

parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined \
        --always HEAD) 2>/dev/null
}

# show red star if there are uncommitted changes
parse_git_dirty() {
    if git diff-index --quiet HEAD 2> /dev/null; then
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    else
        echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    fi
}

# if in a git repo, show dirty indicator + git branch
git_custom_status() {
    local git_where="$(parse_git_branch)"
    if [ -n "$git_where" ]; then
        echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX"
        echo -n "${git_where#(refs/heads/|tags/)}"
        echo -n "$(parse_git_dirty)"
        echo "$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}
