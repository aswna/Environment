#!/bin/bash

### Pull all git submodules except for the modules described by EXCLUDE_MODULES.

# Extended regular expression:
EXCLUDE_MODULES="cecil"

execute_git_pull()
{
    repo_dir="$1"
    echo
    echo "Pull in ${repo_dir}"
    git pull
}


checkout_master()
{
    repo_dir="$1"
    echo
    echo "Checkout master in ${repo_dir}"
    git checkout master
}


pull_all_submodules_in_repository()
{
    old_pwd=`pwd`
    repo_dir="$1"
    cd ${repo_dir}

    #checkout_master ${repo_dir}
    execute_git_pull ${repo_dir}

    if [ -r .gitmodules ]; then
        echo "Found .gitmodules file..."
        for submodule in $(sed -n 's/^\tpath = //p' .gitmodules | egrep -v "${EXCLUDE_MODULES}"); do
            (pull_all_submodules_in_repository "${submodule}")
        done
    fi

    cd ${old_pwd}
}


get_status()
{
    git status
}

pull_all_submodules_in_repository `pwd`
get_status
