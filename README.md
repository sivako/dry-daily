# dry-daily
Everyday commands used by developer like branching, committing, pushing code etc. 

### create a git branch
```bash
mcreate my_branch
```

### make commit
```bash
mcommit "this is the commit message"
```

### push your branch
pushes the current branch to remote
```bash
mpush
```

### combine create, commit and push
combine mcreate, mcommit and mpush commands into one command.
```bash
mpr my_branch "this is the commit message"
```

### delete a git branch
deletes currently selected branch.
```bash
mdelete_branch
```

### view pretty log
see the git log in pretty format. oneline for each commit
```bash
mlog
```

### show git branch
show the git branch
```bash
git_branch
```

### see the details of above m commands
What exactly does the above commands does.
```bash
mwhat mlog
```
