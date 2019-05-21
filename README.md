# git_grep_in_branches
Simple script to search content by means of grep in the branches of a repository.

### How to isntall
Just clone this repo and provide execution permissions to the bash script
```
git clone https://github.com/theraulpareja/git_grep_in_branches.git
cd git_grep_in_branches
chmod +x git_grep_in_branches.sh
```

### How to use it
The script requires 2 positional parameters the first must be a valid git url and the second is the text pattern that grep will use for the search looping each branch of the repo.

You need read permissions and clone granted to use that script on the repository.

```
./git_grep_in_branches.sh GIT_URL PATTERN
Example:
./git_grep_in_branches.sh https://github.com/theraulpareja/naughty.git troll
```
