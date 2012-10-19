gitthemes_has_help=1

gitthemes_help() {
    cat << 'EOF'

    GitThemes - support for oh-my-zsh themes that show git statuses.
    Author: Frank Erens <frank@synthi.net>
    Depends: None
    Known conflicts: None
    Notes: Adapted from oh-my-zsh

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
