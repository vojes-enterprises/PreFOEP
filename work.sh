# Common commands for working on FOEP
#
# To add such commands run:
#   `source ./work.sh`
#
# To remove such aliases,
# start a new terminal session
#
# Comments are for newbies who need a bit of an intro


### Organization ###
# makes a directory for a subject with an template README.md file
# empty directories will not be added to git
alias mksub='read a; for i in $a; do mkdir $i; touch $i/README.md; done'

# run after making changes to folders (directories) 
alias mktree='tree -d > tree.txt'


### Version Control ###
# interactive adding - use to cherry pick segments to be staged
alias add='git add -p'

# commit w/o -m --- make sure to set $EDITOR
alias commit='git commit'

# push to github and gitlab - uploads to remote git repos
alias push='git push github && git push gitlab && git push srht'

# check the status of the current branch (and much more)
alias status=' git status --column=plain --renames --ignored=traditional --show-stash --untracked-files=normal --branch --verbose'

# make a branch
alias mkbranch='git checkout -b'

# lists branches
alias lsbranch='git branch --list'

# removes a branch
alias rmbranch='git branch --delete'

# switch to a branch
alias swbranch='git checkout'

# copies a branch
alias cpbranch='git branch -c'

# moves a branch
alias mvbranch='git branch -m'

# usually to merge branch with master when branch is finished
alias merge='git merge --squash'

# to update the specified branch with new master commits
# specify the branch to update
alias rebase='git rebase master'

# resetting the local repo back to a commit
alias reset='git reset --soft'

# unresets the reset but in small steps (commit by commit)
alias unreset='git reset HEAD@{1}'

# reset but also resetting the working directory
alias restart='git reset --hard'
