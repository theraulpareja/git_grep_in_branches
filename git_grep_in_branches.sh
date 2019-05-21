#!/usr/bin/env bash

#Search thorught the branches for a pattern

USAGE="
Usage: branch_search REPO_URL PATTERN
Example:
    ./git_grep_in_branches.sh https://github.com/theraulpareja/naughty.git troll
"
TEMP_REPO="/tmp/branch_search"
GREEN='\033[0;32m'
REGULAR='\033[0m'

clone_repo () {
    if [ -d $TEMP_REPO ]; then
        rm -rf $TEMP_REPO
    fi
    repo_url=$1
    git clone --recursive $repo_url $TEMP_REPO > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Could not clone repo"
        exit 10
    fi
}

grep_branches () {
    pattern=$1
    cd $TEMP_REPO
    git fetch origin
    for branch in $(git branch -r | grep -v HEAD | cut -f2 -d '/'); do
        echo -e "$GREEN SCANNING BRANCH $branch $REGULAR"
        git checkout $branch > /dev/null 2>&1
        echo -e "$GREEN Results: $REGULAR"
        grep -iR --color=always $pattern *
        echo -e "$GREEN******************************$REGULAR"
    done
}

#Main 
#usage
if [ $# -ne 2 ]; then
        echo "$USAGE"
fi

REPO_URL=$1
PATTERN=$2

echo  -e "$GREEN Cloning the repo $REPO_URL in $TEMP_REPO $REGULAR"
clone_repo $REPO_URL

echo "Search for $PATTERN in the branches"
grep_branches $PATTERN

echo "Finish"