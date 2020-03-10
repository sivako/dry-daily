
alias gs="git status"
alias gd="git diff"
alias gp="git pull"
alias gcm="git checkout master && git pull"

mwhat() {
	if [ -z "$1" ]
	then
		echo "Missing command name. Usage `$mwhat mcommit`"
	else
		declare -f "$1"
	fi
}

mcommit() {
  echo $1
  git add .
  git commit -m $1
}

mpush() {
	git push origin $git_branch
}

mlog() {
	if [ -z "$1" ]
	then
    git log --pretty=format:'%Cred%h%Creset - %Cgreen(%cr) %C(bold blue)%an%Creset %s' --abbrev-commit --max-count=100
	else
    git log --pretty=format:'%Cred%h%Creset - %Cgreen(%cr) %C(bold blue)%an%Creset %s' --abbrev-commit --max-count=$1
	fi
}

mcreate() {
	if [ -z "$1" ]
	then
		echo "Missing branch name to create. (eg. mcreate foo)"
	else
		git checkout -b $1
		git push --set-upstream origin $1
	fi
}

# create branch, make commit and push
# combining mcreate, mcommit, mpush
# pass branch name and commit message
mpr() {
	if [[ -z "$1" || -z "$2" ]]; then
	  echo 'Missing (branch name) and (commit message)'
	  exit 1
	fi

	git checkout -b $1
	git push --set-upstream origin $1

	git add .
	git commit -m $2

	git push origin $git_branch
}

mdelete_branch() {
	if [ -z "$1" ]; then
	  echo 'Missing (branch name)'
	  exit 1
	fi
	// delete branch locally
	git branch -d $1

	// delete branch remotely
	git push origin --delete $1
}

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\u\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
