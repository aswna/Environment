#!/bin/bash

# git submodule update --init --recursive && git submodule foreach git reset --hard

EXCLUDED_REPOS="YouCompleteMe"

update_all_submodules_in_repository()
{
    repo_dir="${1}"

    update_submodules_in_repository "${repo_dir}"
    for submodule in $(sed -n 's/^\tpath = //p' .gitmodules | egrep -v ${EXCLUDED_REPOS}); do
        update_submodules_in_repository "${submodule}"
    done
}


update_submodules_in_repository()
{
    repo_dir="${1}"
    old_pwd="$(pwd)"

    echo
    echo "Working in ${repo_dir}"

    cd "${repo_dir}"
    init_and_update_submodules
    checkout_master
    pull_repository
    reset_submodules
    cd "${old_pwd}"

    echo
}


init_and_update_submodules()
{
    echo "git submodules update"
    git submodule update --init --recursive
}


checkout_master()
{
    echo "git checkout master"
    git checkout master
}


pull_repository()
{
    echo "git pull"
    git pull
}


reset_submodules()
{
    echo "git submodule reset"
    git submodule foreach git reset --hard
}


get_status()
{
    echo
    git status
}


update_all_submodules_in_repository "$(pwd)"
get_status
