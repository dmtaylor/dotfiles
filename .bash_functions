#!/bin/bash
# bash functions file

# up command: stolen from HN
function up {
    local d=""
    limit="$1"
    case $limit in
        *[!0-9]*)
            echo "$limit is not a number"
            return
            ;;
        *) ;;
    esac
    for ((i=1 ; i <= limit ; i++)) ; do
        d="$d/.."
    done
    d="$(echo $d | sed 's/^\///')"
    if [ -z "$d" ] ; then
        d=".."
    fi
    cd "$d"
}

# tmux update env command
function tmux() {
    local tmux=$(type -fp tmux)
    case "$1" in
        update-environment|update-env|env-update)
            local v
            while read v ; do
                if [[ $v == -* ]] ; then
                    unset ${v/#-/}
                else
                    v=${v/=/=\"}
                    v=${v/%/\"}
                    eval export $v
                fi
            done < <(tmux show-environment)
            ;;
        *)
            $tmux "$@"
            ;;
    esac
}

# print git log output for branch usable for reviews
function cr-branch() {
    base="master"
    if [[ $# -eq 0 ]] ; then 
        exit 1;
    elif [[ $# -ge 2 ]] ; then
        base="$1"
        shift
    fi

    branch="$1"

    git fetch
    git checkout "$branch" || ( echo "ERROR: pulling branch '$branch' failed, fix and retry" ; exit 111 )
    git log -p --unified=20 --reverse --pretty=fuller "$base"..."$branch"
}

